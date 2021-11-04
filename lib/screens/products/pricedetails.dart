import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimartadmin/constants/constants.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:digimartadmin/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';

class AddProducts extends StatefulWidget {
  var nameval,
      brandnameval,
      desval,
      stockval,
      onsale,
      featured,
      recommended,
      offerpriceval,
      category,
      variationval,
      mrpval,
      keywordsval,
      type,
      docid,
      image;
  bool isedit;
  AddProducts(
      {this.nameval,
      this.brandnameval,
      this.desval,
      this.stockval,
      this.onsale,
      this.featured,
      this.recommended,
      this.offerpriceval,
      this.category,
      this.variationval,
      this.isedit,
      this.mrpval,
      this.keywordsval,
      this.type,
      this.docid,
      this.image});

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  ScrollController scrollbarcontroller = ScrollController();
  List<String> url = [];
  List<String> variationurl = [];
  TextEditingController variationname = TextEditingController();
  TextEditingController variationprice = TextEditingController();
  TextEditingController variationofferprice = TextEditingController();
  TextEditingController variationvalue = TextEditingController();
  TextEditingController variationstock = TextEditingController();

  List<VarientionModel> variations = [];
  List<Varient> varientslist = [];
  TextEditingController pname;
  TextEditingController pdescription;
  TextEditingController mrp;
  TextEditingController stock;
  TextEditingController variation;
  TextEditingController keywords;
  TextEditingController offerprice;
  TextEditingController brandname;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pname = TextEditingController(text: widget.nameval);
    pdescription = TextEditingController(text: widget.desval);
    mrp = TextEditingController(text: widget.mrpval);
    stock = TextEditingController(text: widget.stockval);
    variation = TextEditingController(text: widget.variationval);
    keywords = TextEditingController(text: widget.keywordsval);
    offerprice = TextEditingController(text: widget.offerpriceval);
    brandname = TextEditingController(text: widget.brandnameval);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        showTrackOnHover: true,
        isAlwaysShown: true,
        controller: scrollbarcontroller,
        child: SingleChildScrollView(
          controller: scrollbarcontroller,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add Products',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              url.isEmpty
                  ? Container()
                  : Container(
                      width: 300,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemCount: url.length,
                        // scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 50,
                            width: 70,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CachedNetworkImage(
                                    imageUrl: url[index],
                                    height: 40,
                                    width: 60)),
                          );
                        },
                      ),
                    ),
              Card(
                  color: secondaryColor,
                  child: Center(
                    child: TextButton.icon(
                        onPressed: () => uploadToStorage(false,
                            fileName: DateTime.now().millisecondsSinceEpoch),
                        icon: Icon(Icons.upload_file),
                        label: Text('Add Image')),
                  )),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: pname,
                    decoration: InputDecoration(
                        labelText: 'Enter Product Name',
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: brandname,
                      decoration: InputDecoration(
                          labelText: 'Brand Name',
                          floatingLabelBehavior: FloatingLabelBehavior.always)),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: pdescription,
                    decoration: InputDecoration(
                        labelText: 'Product Description',
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('type'),
                    trailing: DropdownButton(
                      value: widget.type,
                      onChanged: (value) {
                        setState(() {
                          widget.type = value;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'veg',
                          child: Text('Veg'),
                        ),
                        DropdownMenuItem(
                          value: 'nonveg',
                          child: Text('Non Veg'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mrp,
                    decoration: InputDecoration(
                        labelText: 'MRP',
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: variation,
                    decoration: InputDecoration(
                        labelText: 'Variation Value',
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: keywords,
                    decoration: InputDecoration(
                        labelText:
                            'Enter List of Keywords seperated by comma ","',
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Featured Product'),
                    trailing: DropdownButton(
                      value: widget.featured,
                      onChanged: (value) {
                        setState(() {
                          widget.featured = value;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: true,
                          child: Text('True'),
                        ),
                        DropdownMenuItem(
                          value: false,
                          child: Text('False'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Recommended Product'),
                    trailing: DropdownButton(
                      value: widget.recommended,
                      onChanged: (value) {
                        setState(() {
                          widget.recommended = value;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: true,
                          child: Text('True'),
                        ),
                        DropdownMenuItem(
                          value: false,
                          child: Text('False'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: stock,
                    decoration: InputDecoration(
                        labelText: 'Total Product Stock ',
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                ),
              ),
              // Card(
              //   color: secondaryColor,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ListTile(
              //       title: Text('On Sale'),
              //       trailing: DropdownButton(
              //         value: widget.onsale,
              //         onChanged: (value) {
              //           setState(() {
              //             widget.onsale = value;
              //           });
              //         },
              //         items: [
              //           DropdownMenuItem(
              //             value: true,
              //             child: Text('True'),
              //           ),
              //           DropdownMenuItem(
              //             value: false,
              //             child: Text('False'),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Visibility(
                // visible: widget.onsale,
                // child: 
                Card(
                  color: secondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: offerprice,
                      decoration: InputDecoration(
                          labelText: 'Offer Price',
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  ),
                ),
              // ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Select your category :'),
                    trailing: DropdownButton(
                      value: widget.category,
                      onChanged: (value) {
                        setState(() {
                          widget.category = value;
                        });
                      },
                      items: productsController.categories
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value.title,
                          child: Text(value?.title),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Add Variants'),
                              content: Column(
                                children: [
                                  // url.isEmpty
                                  //     ? Container()
                                  //     : ListView.builder(
                                  //         itemCount: url.length,
                                  //         scrollDirection: Axis.horizontal,
                                  //         shrinkWrap: true,
                                  //         itemBuilder: (context, index) {
                                  //           return Padding(
                                  //               padding:
                                  //                   const EdgeInsets.all(8.0),
                                  //               child: CachedNetworkImage(
                                  //                   imageUrl: url[index],
                                  //                   height: 40,
                                  //                   width: 60));
                                  //         },
                                  //       ),
                                  Card(
                                      color: secondaryColor,
                                      child: Center(
                                        child: TextButton.icon(
                                            onPressed: () => uploadToStorage(
                                                true,
                                                fileName: DateTime.now()
                                                    .millisecondsSinceEpoch),
                                            icon: Icon(Icons.upload_file),
                                            label: Text('Add Image')),
                                      )),
                                  Card(
                                    color: secondaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: variationname,
                                        decoration: InputDecoration(
                                            labelText: 'Name',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: secondaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: variationprice,
                                        decoration: InputDecoration(
                                            labelText: 'Mrp',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: secondaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: variationofferprice,
                                        decoration: InputDecoration(
                                            labelText: 'Offer Price',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: secondaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: variationvalue,
                                        decoration: InputDecoration(
                                            labelText: 'Variation Value',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: secondaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: variationstock,
                                        decoration: InputDecoration(
                                            labelText: 'Total Stock',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // productsController.price
                                            //     .clear();
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            var uuid = Uuid();
                                            var id = uuid.v1();
                                            variations.add(
                                              VarientionModel(
                                                  productid: id,
                                                  variation:
                                                      variationvalue.text,
                                                  mrp: variationprice.text,
                                                  name: variationname.text,
                                                  photo: variationurl,
                                                  quantity: variationstock.text,
                                                  offerprice:
                                                      variationofferprice.text),
                                            );
                                            varientslist.add(
                                              Varient(
                                                id: id,
                                                variation: variationvalue.text,
                                              ),
                                            );
                                            Navigator.pop(context);
                                            variationurl.clear();
                                            print(variationurl);
                                          },
                                          child: Text('Save'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    title: Text('Add Variation'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // productsController.price.clear();
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        showDialog(
                            context: Get.context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircularProgressIndicator(),
                                      Text('Loading...')
                                    ]),
                              );
                            });
                        print('Offer Price : ${offerprice.text}');
                        print('MRP : ${mrp.text}');
                        var uuid = Uuid();
                        print(widget.isedit);
                        if (widget.isedit) {
                          firebaseFirestore
                              .collection('products')
                              .doc(widget.docid)
                              .update({
                            'brand': brandname.text,
                            "category": widget.category,
                            "isRecommended": widget.recommended,
                            "maxquantity": int.parse(stock.text),
                            "name": pname.text,
                            "photo_url": widget.image,
                            'mrp': int.parse(mrp.text),
                            'price': int.parse(offerprice.text),
                            "id": widget.docid,
                            "quantity": 1,
                            "keywords": keywords.text.split(','),
                            "onsale": widget.onsale,
                            "description": pdescription.text,
                            "varients": [],
                            "variation": variation.text,
                            'type': widget.type,
                          });
                        } else {
                          List vari = varientslist
                              .map((e) => {'id': e.id, 'vari': e.variation})
                              .toList();
                          var docid = uuid.v4();
                          vari.add({'id': docid, 'vari': variation.text});
                          print('Variention List : $vari');
                          print(docid);
                          print(variations);
                          variations.isEmpty
                              ? firebaseFirestore
                                  .collection('products')
                                  .doc(docid)
                                  .set(
                                  {
                                    'brand': brandname.text,
                                    "category": widget.category,
                                    "isRecommended": widget.recommended,
                                    "maxquantity": int.parse(stock.text),
                                    "name": pname.text,
                                    "keywords": keywords.text.split(','),
                                    "photo_url": url.isEmpty ? [''] : url,
                                    // 'mrp': int.parse(mrp.text),
                                    // 'price': int.parse(offerprice.text),
                                    "id": docid,
                                    "onsale": widget.onsale,
                                    "description": pdescription.text,
                                    "quantity": 1,
                                    "varients": vari,
                                    "variation": variation.text,
                                    'type': widget.type,
                                  },
                                ).whenComplete(() {
                                  Navigator.pop(Get.context);
                                  Navigator.pop(Get.context);
                                })
                              : variations.forEach(
                                  (element) async {
                                    await firebaseFirestore
                                        .collection('products')
                                        .doc(element.productid)
                                        .set(
                                      {
                                        'brand': brandname.text,
                                        "category": widget.category,
                                        "isRecommended": widget.recommended,
                                        "maxquantity":
                                            int.parse(element.quantity),
                                        "name": element.name,
                                        "keywords": keywords.text.split(','),
                                        "photo_url": element.photo.isEmpty
                                            ? ['']
                                            : element.photo,
                                        'mrp': int.parse(element.mrp),
                                        'price': int.parse(element.offerprice),
                                        "id": element.productid,
                                        "onsale": widget.onsale,
                                        "description": pdescription.text,
                                        "quantity": 1,
                                        "varients": vari,
                                        "variation": element.variation,
                                        'type': widget.type,
                                      },
                                    );
                                    // .whenComplete(() {
                                    print('Added Sub Categories');

                                    firebaseFirestore
                                        .collection('products')
                                        .doc(docid)
                                        .set(
                                      {
                                        'brand': brandname.text,
                                        "category": widget.category,
                                        "isRecommended": widget.recommended,
                                        "maxquantity": int.parse(stock.text),
                                        "name": pname.text,
                                        "keywords": keywords.text.split(','),
                                        "photo_url": url,
                                        'mrp': int.parse(mrp.text),
                                        'price': int.parse(offerprice.text),
                                        "id": docid,
                                        "onsale": widget.onsale,
                                        "description": pdescription.text,
                                        "quantity": 1,
                                        "varients": vari,
                                        "variation": variation.text,
                                        'type': widget.type,
                                      },
                                    ).whenComplete(() {
                                      Navigator.pop(Get.context);
                                      Navigator.pop(Get.context);
                                    });
                                    // });
                                  },
                                );
                        }
                      },
                      child: Text('Save'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void uploadImage({@required Function(File file) onSelected}) {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
        showDialog(
            context: Get.context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading...')
                    ]),
              );
            });
      });
    });
  }

  void uploadToStorage(bool isvariant, {fileName}) {
    final path = 'products/$fileName';
    uploadImage(onSelected: (file) {
      fb
          .storage()
          .refFromURL('gs://digimart-44fde.appspot.com/')
          .child(path)
          .put(file)
          .future
          .then((data) async {
        Uri uri = await data.ref.getDownloadURL();
        setState(() {
          isvariant
              ? variationurl.add(uri.toString())
              : url.add(uri.toString());
        });
        Navigator.pop(Get.context);
      });
    });
  }
}
