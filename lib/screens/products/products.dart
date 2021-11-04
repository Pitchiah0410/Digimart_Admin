import 'dart:html';

<<<<<<< HEAD
=======
<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
=======
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:digimartadmin/models/productmodel.dart';
import 'package:digimartadmin/screens/products/pricedetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:firebase/firebase.dart' as fb;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:uuid/uuid.dart';
import '../../constants.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController minfee =
      TextEditingController(text: orderController.ordercongig.minfee);
  TextEditingController maxfee =
      TextEditingController(text: orderController.ordercongig.maxfee);
  TextEditingController range =
      TextEditingController(text: orderController.ordercongig.range);
<<<<<<< HEAD

=======
  String url = '';
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
  ScrollController horizontalcontroller = ScrollController();
  ScrollController verticalcontroller = ScrollController();
  List<ProductModel> usersFiltered = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    usersFiltered = productsController.products;
  }

  var rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      showTrackOnHover: true,
      controller: horizontalcontroller,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: horizontalcontroller,
        scrollDirection: Axis.horizontal,
        child: Scrollbar(
          showTrackOnHover: true,
          controller: verticalcontroller,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            controller: verticalcontroller,
            scrollDirection: Axis.vertical,
            child: Obx(
              () => productsController.products.isEmpty
<<<<<<< HEAD
                  ? Padding(
=======
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 300,
                                  child: Card(
                                    color: secondaryColor,
                                    child: new ListTile(
                                      leading: new Icon(Icons.search),
                                      title: new TextField(
                                          controller: controller,
                                          decoration: new InputDecoration(
                                              hintText: 'Search',
                                              border: InputBorder.none),
                                          onChanged: (value) {
                                            setState(() {
                                              usersFiltered = productsController
                                                  .products
                                                  .where((products) =>
                                                      products.name
                                                          .toLowerCase()
                                                          .contains(value
                                                              .toLowerCase()) ||
                                                      products.category
                                                          .contains(value
                                                              .toLowerCase()))
                                                  .toList();
                                            });
                                          }),
<<<<<<< HEAD
=======
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    buildShowDialog(
                                      context: context,
                                      taxval: '0',
                                      nameval: '',
                                      // priceval: '',
                                      desval: '',
                                      pincodeval: '',
                                      stockval: '',
                                      onsale: false,
                                      featured: false,
                                      // offerpriceval: '',
                                      category: productsController
                                          .categories.first.title,
                                      // variationval: 'Kg',

                                      isedit: false,
                                      // variationlistval: ''
                                    );
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text('Add Item'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('MinFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: minfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'minfee': minfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('MaxFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: maxfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'maxfee': maxfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Range Value : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: range,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'range': range.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                          usersFiltered == null || usersFiltered.length == 0
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.81,
                                  child: PaginatedDataTable(
                                    showCheckboxColumn: false,
                                    source: DataTableSourceExpedition(
                                      context: context,
                                      onRowClicked: (index) {
                                        var element = usersFiltered[index];
                                        String pincodestring =
                                            element.pincode.toString();
                                        buildShowDialog(
                                            context: context,
<<<<<<< HEAD
                                            nameval: element.name,
                                            priceval: element.price.obs,
=======
                                            taxval: element.tax,
                                            nameval: element.name,
                                            // priceval: element.price.toString(),
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                                            desval: element.description,
                                            pincodeval: pincodestring.substring(
                                                1, pincodestring.length - 1),
                                            stockval:
                                                element.quantity.toString(),
                                            onsale: element.onsale,
                                            featured: element.featured,
<<<<<<< HEAD
                                            category: element.category,
                                            isedit: true,
                                            docid: element.docid,
                                            image: element.photoUrl[0]);
=======
                                            // offerpriceval:
                                            //     element.offerprice.toString(),
                                            category: element.category,
                                            // variationval: element.variationtype,
                                            // rating: element.rating,
                                            isedit: true,
                                            // variationlistval: element.variation
                                            //     .toString()
                                            //     .replaceAll('[', '')
                                            //     .replaceAll(']', ''),
                                            docid: element.docid,
                                            image: element.photo[0]);
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                                      },
                                      expeditions: usersFiltered,
                                    ),
                                    showFirstLastButtons: true,
                                    rowsPerPage: rowsPerPage,
                                    availableRowsPerPage: [1, 5, 10, 50],
                                    onRowsPerPageChanged: (newRowsPerPage) {
                                      if (newRowsPerPage != null) {
                                        setState(() {
                                          rowsPerPage = newRowsPerPage;
                                        });
                                      }
                                    },

                                    columns: [
                                      DataColumn(
                                        label: Text('SI.No'),
                                      ),
                                      DataColumn(
                                        label: Text('Delete'),
                                      ),
                                      DataColumn(
                                        label: Text('Image'),
                                      ),
                                      DataColumn(
                                        label: Text('Name'),
                                      ),
                                      DataColumn(
<<<<<<< HEAD
                                        label: Text('Price'),
                                      ),
                                      DataColumn(
                                        label: Text('Product ID'),
                                      ),

=======
                                        label: Text('Product ID'),
                                      ),
                                      // DataColumn(
                                      //   label: Text('Price'),
                                      // ),
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                                      DataColumn(
                                        label: Text('Available Stock'),
                                      ),
                                      DataColumn(
                                        label: Text('On sale'),
                                      ),
<<<<<<< HEAD
                                      // DataColumn(
                                      //   label: Text('Offer Price'),
                                      // ),
=======
                                      DataColumn(
                                        label: Text('Offer Price'),
                                      ),
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                                      DataColumn(
                                        label: Text('Description'),
                                      ),
                                      DataColumn(
                                        label: Text('Category'),
                                      ),
                                    ],
                                    // rows:
                                  ),
                                ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Future buildShowDialog(
      {BuildContext context,
      taxval,
      nameval,
<<<<<<< HEAD
      RxList<Price> priceval,
=======
      // priceval,
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
      desval,
      pincodeval,
      stockval,
      onsale,
      featured,
      // offerpriceval,
      category,
      // variationval,
      bool isedit,
      // variationlistval,
      docid,
      image}) {
    ScrollController scrollbarcontroller = ScrollController();
    var uuid = Uuid();
    TextEditingController pname = TextEditingController(text: nameval);
    TextEditingController pdescription = TextEditingController(text: desval);
    TextEditingController pincode = TextEditingController(text: pincodeval);
    TextEditingController stock = TextEditingController(text: stockval);
    TextEditingController tax = TextEditingController(text: taxval);

    // TextEditingController offerprice =
    //     TextEditingController(text: offerpriceval);
    // TextEditingController regularprice = TextEditingController(text: priceval);
    // TextEditingController variationlist =
    //     TextEditingController(text: variationlistval);
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setstate) {
          return Dialog(
            backgroundColor: bgColor,
            child: Scrollbar(
              showTrackOnHover: true,
              isAlwaysShown: true,
              controller: scrollbarcontroller,
              child: SingleChildScrollView(
                controller: scrollbarcontroller,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Add Products',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
<<<<<<< HEAD
                      url == ''
                          ? image == null
                              ? Container()
                              : Image.network(
                                  image,
                                  height: 200,
                                  width: double.infinity,
                                )
                          : Image.network(
                              url,
                              height: 200,
                              width: double.infinity,
                            ),
=======
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                      Card(
                          color: secondaryColor,
                          child: Center(
                            child: TextButton.icon(
                                onPressed: () => uploadToStorage(
<<<<<<< HEAD
                                    state: setstate,
=======
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                                    fileName:
                                        DateTime.now().millisecondsSinceEpoch),
                                icon: Icon(Icons.upload_file),
                                label: Text('Upload Image')),
                          )),
                      Card(
                        color: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: pname,
                            decoration: InputDecoration(
                                labelText: 'Enter Product Name',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                      ),
                      // Card(
                      //   color: secondaryColor,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: TextField(
                      //         controller: regularprice,
                      //         decoration: InputDecoration(
                      //             labelText: 'Enter Regular Price',
                      //             floatingLabelBehavior:
                      //                 FloatingLabelBehavior.always)),
                      //   ),
                      // ),

                      Card(
                        color: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: pdescription,
                            decoration: InputDecoration(
                                labelText: 'Enter Product Description',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Card(
                          color: secondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
<<<<<<< HEAD
                            child:
                                //  Obx(
                                //   () =>
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PriceDetails(),
                                        ),
                                      );
                                      print(productsController.price);
                                    },
                                    child: Text('Add Price'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor),
                                    ),
                                  ),
                                  Card(
                                    color: bgColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Obx(
                                        () => SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: DataTable(
                                            showCheckboxColumn: false,
                                            rows: priceval == null
                                                ? productsController.price
                                                    .map(
                                                      (element) => DataRow(
                                                        cells: [
                                                          DataCell(
                                                            SizedBox(
                                                              width: 70,
                                                              child: Text(
                                                                element
                                                                    .variation,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Text(element.price),
                                                          ),
                                                          DataCell(
                                                            Text(element
                                                                .offerprice),
                                                          ),
                                                          DataCell(IconButton(
                                                              icon: Icon(
                                                                  Icons.edit),
                                                              onPressed: () {
                                                                TextEditingController
                                                                    variation =
                                                                    TextEditingController(
                                                                        text: element
                                                                            .variation);
                                                                TextEditingController
                                                                    mrp =
                                                                    TextEditingController(
                                                                        text: element
                                                                            .price);
                                                                TextEditingController
                                                                    offerprice =
                                                                    TextEditingController(
                                                                        text: element
                                                                            .offerprice);
                                                                Get.dialog(
                                                                    AlertDialog(
                                                                  backgroundColor:
                                                                      bgColor,
                                                                  content: Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        TextField(
                                                                            controller:
                                                                                variation,
                                                                            decoration:
                                                                                InputDecoration(labelText: 'Variation', floatingLabelBehavior: FloatingLabelBehavior.always)),
                                                                        TextField(
                                                                            controller:
                                                                                mrp,
                                                                            decoration:
                                                                                InputDecoration(labelText: 'MRP', floatingLabelBehavior: FloatingLabelBehavior.always)),
                                                                        TextField(
                                                                          controller:
                                                                              offerprice,
                                                                          decoration: InputDecoration(
                                                                              labelText: 'Offer Price',
                                                                              floatingLabelBehavior: FloatingLabelBehavior.always),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              ElevatedButton(
                                                                                onPressed: () {
                                                                                  productsController.price.clear();
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text('Cancel'),
                                                                                style: ButtonStyle(
                                                                                  backgroundColor: MaterialStateProperty.all(primaryColor),
                                                                                ),
                                                                              ),
                                                                              ElevatedButton(
                                                                                onPressed: () {
                                                                                  firebaseFirestore.collection('products').doc(docid).update({
                                                                                    'price': FieldValue.arrayRemove([
                                                                                      {
                                                                                        'variation': element.variation,
                                                                                        'mrp': element.price,
                                                                                        'offerprice': element.offerprice
                                                                                      }
                                                                                    ])
                                                                                  }).whenComplete(() {
                                                                                    firebaseFirestore.collection('products').doc(docid).update({
                                                                                      'price': FieldValue.arrayUnion([
                                                                                        {
                                                                                          'variation': variation.text,
                                                                                          'mrp': mrp.text,
                                                                                          'offerprice': offerprice.text
                                                                                        }
                                                                                      ])
                                                                                    });
                                                                                  });
                                                                                },
                                                                                child: Text('Submit'),
                                                                                style: ButtonStyle(
                                                                                  backgroundColor: MaterialStateProperty.all(primaryColor),
                                                                                ),
                                                                              ),
                                                                            ])
                                                                      ]),
                                                                ));
                                                              })),
                                                          DataCell(IconButton(
                                                              icon: Icon(
                                                                  Icons.delete),
                                                              onPressed: () {
                                                                firebaseFirestore
                                                                    .collection(
                                                                        'products')
                                                                    .doc(docid)
                                                                    .update({
                                                                  'price':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    {
                                                                      'variation':
                                                                          element
                                                                              .variation,
                                                                      'mrp': element
                                                                          .price,
                                                                      'offerprice':
                                                                          element
                                                                              .offerprice
                                                                    }
                                                                  ])
                                                                });
                                                              }))
                                                        ],
                                                      ),
                                                    )
                                                    .toList()
                                                : priceval != null &&
                                                        productsController
                                                            .price.isNotEmpty
                                                    ? productsController.price
                                                        .map(
                                                          (element) => DataRow(
                                                            cells: [
                                                              DataCell(
                                                                SizedBox(
                                                                  width: 70,
                                                                  child: Text(
                                                                      element
                                                                          .variation),
                                                                ),
                                                              ),
                                                              DataCell(
                                                                Text(element
                                                                    .price),
                                                              ),
                                                              DataCell(
                                                                Text(element
                                                                    .offerprice),
                                                              ),
                                                              DataCell(
                                                                  IconButton(
                                                                      icon: Icon(
                                                                          Icons
                                                                              .edit),
                                                                      onPressed:
                                                                          () {
                                                                        TextEditingController
                                                                            variation =
                                                                            TextEditingController(text: element.variation);
                                                                        TextEditingController
                                                                            mrp =
                                                                            TextEditingController(text: element.price);
                                                                        TextEditingController
                                                                            offerprice =
                                                                            TextEditingController(text: element.offerprice);
                                                                        Get.dialog(
                                                                            AlertDialog(
                                                                          backgroundColor:
                                                                              bgColor,
                                                                          content: Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                TextField(controller: variation, decoration: InputDecoration(labelText: 'Variation', floatingLabelBehavior: FloatingLabelBehavior.always)),
                                                                                TextField(controller: mrp, decoration: InputDecoration(labelText: 'MRP', floatingLabelBehavior: FloatingLabelBehavior.always)),
                                                                                TextField(
                                                                                  controller: offerprice,
                                                                                  decoration: InputDecoration(labelText: 'Offer Price', floatingLabelBehavior: FloatingLabelBehavior.always),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 20,
                                                                                ),
                                                                                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                                                                  ElevatedButton(
                                                                                    onPressed: () {
                                                                                      productsController.price.clear();
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text('Cancel'),
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(primaryColor),
                                                                                    ),
                                                                                  ),
                                                                                  ElevatedButton(
                                                                                    onPressed: () {
                                                                                      firebaseFirestore.collection('products').doc(docid).update({
                                                                                        'price': FieldValue.arrayRemove([
                                                                                          {
                                                                                            'variation': element.variation,
                                                                                            'mrp': element.price,
                                                                                            'offerprice': element.offerprice
                                                                                          }
                                                                                        ])
                                                                                      }).whenComplete(() {
                                                                                        firebaseFirestore.collection('products').doc(docid).update({
                                                                                          'price': FieldValue.arrayUnion([
                                                                                            {
                                                                                              'variation': variation.text,
                                                                                              'mrp': mrp.text,
                                                                                              'offerprice': offerprice.text
                                                                                            }
                                                                                          ])
                                                                                        });
                                                                                      });
                                                                                    },
                                                                                    child: Text('Submit'),
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(primaryColor),
                                                                                    ),
                                                                                  ),
                                                                                ])
                                                                              ]),
                                                                        ));
                                                                      })),
                                                              DataCell(
                                                                  IconButton(
                                                                      icon: Icon(
                                                                          Icons
                                                                              .delete),
                                                                      onPressed:
                                                                          () {
                                                                        firebaseFirestore
                                                                            .collection('products')
                                                                            .doc(docid)
                                                                            .update({
                                                                          'price':
                                                                              FieldValue.arrayRemove([
                                                                            {
                                                                              'variation': element.variation,
                                                                              'mrp': element.price,
                                                                              'offerprice': element.offerprice
                                                                            }
                                                                          ])
                                                                        });
                                                                      }))
                                                            ],
                                                          ),
                                                        )
                                                        .toList()
                                                    : priceval
                                                        .map(
                                                          (element) => DataRow(
                                                            cells: [
                                                              DataCell(
                                                                SizedBox(
                                                                  width: 70,
                                                                  child: Text(
                                                                      element
                                                                          .variation),
                                                                ),
                                                              ),
                                                              DataCell(
                                                                Text(element
                                                                    .mrp),
                                                              ),
                                                              DataCell(
                                                                Text(element
                                                                    .offerprice),
                                                              ),
                                                              DataCell(
                                                                IconButton(
                                                                  icon: Icon(
                                                                      Icons
                                                                          .edit),
                                                                  onPressed:
                                                                      () {
                                                                    TextEditingController
                                                                        variation =
                                                                        TextEditingController(
                                                                            text:
                                                                                element.variation);
                                                                    TextEditingController
                                                                        mrp =
                                                                        TextEditingController(
                                                                            text:
                                                                                element.mrp);
                                                                    TextEditingController
                                                                        offerprice =
                                                                        TextEditingController(
                                                                            text:
                                                                                element.offerprice);
                                                                    Get.dialog(
                                                                        AlertDialog(
                                                                      backgroundColor:
                                                                          bgColor,
                                                                      content: Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            TextField(
                                                                                controller: variation,
                                                                                decoration: InputDecoration(labelText: 'Variation', floatingLabelBehavior: FloatingLabelBehavior.always)),
                                                                            TextField(
                                                                                controller: mrp,
                                                                                decoration: InputDecoration(labelText: 'MRP', floatingLabelBehavior: FloatingLabelBehavior.always)),
                                                                            TextField(
                                                                              controller: offerprice,
                                                                              decoration: InputDecoration(labelText: 'Offer Price', floatingLabelBehavior: FloatingLabelBehavior.always),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                                                              ElevatedButton(
                                                                                onPressed: () {
                                                                                  productsController.price.clear();
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text('Cancel'),
                                                                                style: ButtonStyle(
                                                                                  backgroundColor: MaterialStateProperty.all(primaryColor),
                                                                                ),
                                                                              ),
                                                                              ElevatedButton(
                                                                                onPressed: () {
                                                                                  showDialog(
                                                                                      context: Get.context,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                          content: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                                                                            CircularProgressIndicator(),
                                                                                            Text('Loading...')
                                                                                          ]),
                                                                                        );
                                                                                      });
                                                                                  print('Submit');
                                                                                  firebaseFirestore.collection('products').doc(docid).update({
                                                                                    'price': FieldValue.arrayRemove([
                                                                                      {
                                                                                        'variation': element.variation,
                                                                                        'mrp': element.mrp,
                                                                                        'offerprice': element.offerprice
                                                                                      }
                                                                                    ])
                                                                                  }).whenComplete(() {
                                                                                    print('Submit 2');
                                                                                    firebaseFirestore.collection('products').doc(docid).update({
                                                                                      'price': FieldValue.arrayUnion([
                                                                                        {
                                                                                          'variation': variation.text,
                                                                                          'mrp': mrp.text,
                                                                                          'offerprice': offerprice.text
                                                                                        }
                                                                                      ])
                                                                                    }).whenComplete(() {
                                                                                      Navigator.pop(Get.context);
                                                                                      Navigator.pop(Get.context);
                                                                                      variation.clear();
                                                                                      mrp.clear();
                                                                                      offerprice.clear();
                                                                                    });
                                                                                  });
                                                                                },
                                                                                child: Text('Submit'),
                                                                                style: ButtonStyle(
                                                                                  backgroundColor: MaterialStateProperty.all(primaryColor),
                                                                                ),
                                                                              ),
                                                                            ])
                                                                          ]),
                                                                    ));
                                                                  },
                                                                ),
                                                              ),
                                                              DataCell(
                                                                IconButton(
                                                                  icon: Icon(Icons
                                                                      .delete),
                                                                  onPressed:
                                                                      () {
                                                                    firebaseFirestore
                                                                        .collection(
                                                                            'products')
                                                                        .doc(
                                                                            docid)
                                                                        .update({
                                                                      'price':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        {
                                                                          'variation':
                                                                              element.variation,
                                                                          'mrp':
                                                                              element.mrp,
                                                                          'offerprice':
                                                                              element.offerprice
                                                                        }
                                                                      ])
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                        .toList(),
                                            columns: [
                                              DataColumn(
                                                label: Text('Variation'),
                                              ),
                                              DataColumn(
                                                label: Text('MRP'),
                                              ),
                                              DataColumn(
                                                label: Text('Offer Price'),
                                              ),
                                              DataColumn(
                                                label: Text('Edit'),
                                              ),
                                              DataColumn(
                                                label: Text('Delete'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
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
                              value: featured,
                              onChanged: (value) {
                                setstate(() {
                                  featured = value;
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
                            controller: pincode,
                            decoration: InputDecoration(
                                labelText:
                                    'Enter List of Pincode seperated by comma (,)',
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
                            controller: tax,
                            decoration: InputDecoration(
                                hintText: 'Enter Product Tax in %',
                                labelText: 'Enter Product Tax in %',
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
                            controller: stock,
                            decoration: InputDecoration(
                                labelText: 'Enter Total Product Stock ',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                      ),
                      Card(
                        color: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('On Sale'),
                            trailing: DropdownButton(
                              value: onsale,
                              onChanged: (value) {
                                setstate(() {
                                  onsale = value;
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
=======
                            child: Obx(
                              () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PriceDetails(),
                                          ),
                                        );
                                        print(productsController.price);
                                      },
                                      child: Text('Add Price'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor),
                                      ),
                                    ),
                                    Card(
                                      color: bgColor,
                                      // child: ListView.builder(
                                      //     shrinkWrap: true,
                                      //     itemCount:
                                      //         productsController.price.length,
                                      //     itemBuilder: (context, index) {
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DataTable(
                                          rows: productsController.price.map(
                                            (element) => DataRow(
                                              cells: [
                                                DataCell(
                                                  Text(element.variation),
                                                ),
                                                DataCell(
                                                  Text(element.price),
                                                ),
                                                DataCell(
                                                  Text(element.offerprice),
                                                )
                                              ],
                                            ),
                                          ).toList(),
                                          columns: [
                                            // DataColumn(
                                            //   label: Text('SI.No'),
                                            // ),
                                            DataColumn(
                                              label: Text('Variation'),
                                            ),
                                            DataColumn(
                                              label: Text('MRP'),
                                            ),
                                            DataColumn(
                                              label: Text('Offer Price'),
                                            ),
                                          ],
                                        ),
                                        // child: Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        //   children: [
                                        //     Text(productsController
                                        //         .price[index].variation),
                                        //         Text(productsController
                                        //         .price[index].price),
                                        //         Text(productsController
                                        //         .price[index].variation),
                                        //   ],
                                        // ),
                                      ),
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
                                    ),
                                  ]),
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                            ),
                          ),
                        ),
                      ),
<<<<<<< HEAD

=======
                      // Card(
                      //   color: secondaryColor,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: ListTile(
                      //       title: Text('Variation'),
                      //       trailing: DropdownButton(
                      //         value: variationval,
                      //         onChanged: (value) {
                      //           setstate(() {
                      //             variationval = value;
                      //           });
                      //         },
                      //         items: [
                      //           DropdownMenuItem(
                      //             value: 'Kg',
                      //             child: Text('Kg'),
                      //           ),
                      //           DropdownMenuItem(
                      //             value: 'Ml',
                      //             child: Text('Ml'),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Card(
                      //   color: secondaryColor,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: TextField(
                      //       controller: variationlist,
                      //       decoration: InputDecoration(
                      //           labelText:
                      //               'Enter List of Quantity seperated by comma (,); Eg. 500g, 250g, 1Kg',
                      //           floatingLabelBehavior:
                      //               FloatingLabelBehavior.always),
                      //     ),
                      //   ),
                      // ),
                      Card(
                        color: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('Featured Product'),
                            trailing: DropdownButton(
                              value: featured,
                              onChanged: (value) {
                                setstate(() {
                                  featured = value;
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
<<<<<<< HEAD
                                SizedBox(
                                  width: 50,
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddProducts(
                                                  isedit: false,
                                                  onsale: true,
                                                  featured: false,
                                                  category: productsController
                                                      .categories.first.title,
                                                )));
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text('Add Item'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('MinFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: minfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'minfee': minfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('MaxFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: maxfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'maxfee': maxfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Range Value : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: range,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'range': range.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'No Products Available',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: Colors.white70),
                            ),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 300,
                                  child: Card(
                                    color: secondaryColor,
                                    child: new ListTile(
                                      leading: new Icon(Icons.search),
                                      title: new TextField(
                                          controller: controller,
                                          decoration: new InputDecoration(
                                              hintText: 'Search',
                                              border: InputBorder.none),
                                          onChanged: (value) {
                                            setState(() {
                                              usersFiltered = productsController
                                                  .products
                                                  .where((products) =>
                                                      products.name
                                                          .toLowerCase()
                                                          .contains(value
                                                              .toLowerCase()) ||
                                                      products.category
                                                          .contains(value
                                                              .toLowerCase()))
                                                  .toList();
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddProducts(
                                            isedit: false,
                                            onsale: false,
                                            featured: false,
                                            category: productsController
                                                .categories.first.title,
                                          ),
                                        ));
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text('Add Item'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor),
                                  ),
=======
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
                            controller: pincode,
                            decoration: InputDecoration(
                                labelText:
                                    'Enter List of Pincode seperated by comma (,)',
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
                            controller: tax,
                            decoration: InputDecoration(
                                hintText: 'Enter Product Tax in %',
                                labelText: 'Enter Product Tax in %',
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
                            controller: stock,
                            decoration: InputDecoration(
                                labelText: 'Enter Total Product Stock ',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                      ),
                      Card(
                        color: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('On Sale'),
                            trailing: DropdownButton(
                              value: onsale,
                              onChanged: (value) {
                                setstate(() {
                                  onsale = value;
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
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
                                ),
                              ],
                            ),
                          ),
<<<<<<< HEAD
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('MinFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: minfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'minfee': minfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
=======
                        ),
                      ),
                      // ),
                      // Visibility(
                      //   visible: onsale,
                      //   child: Card(
                      //     color: secondaryColor,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: TextField(
                      //         controller: offerprice,
                      //         decoration: InputDecoration(
                      //             labelText: 'Offer Price',
                      //             floatingLabelBehavior:
                      //                 FloatingLabelBehavior.always),
                      //       ),
                      //     ),
                      //   ),
                      // ),
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                      Card(
                        color: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('Select your category :'),
                            trailing: DropdownButton(
                              value: category,
                              onChanged: (value) {
                                setstate(() {
                                  category = value;
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                productsController.price.clear();
<<<<<<< HEAD
                                Navigator.pop(context);
                              },
=======
                                 Navigator.pop(context);},
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                              child: Text('Cancel'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                              ),
                            ),
                            ElevatedButton(
<<<<<<< HEAD
                              onPressed: () {
                                print(isedit);
                                isedit
                                    ? productsController.updateProducts({
                                        "name": pname.text,
                                        "category": category,
                                        "photo_url": [
                                          url.isEmpty ? image : url
                                        ],
                                        if (productsController.price.isNotEmpty)
                                          "price": FieldValue.arrayUnion(
                                            productsController.price
                                                .map((element) => {
                                                      'variation':
                                                          element.variation,
                                                      'mrp': element.price,
                                                      'offerprice':
                                                          element.offerprice
                                                    })
                                                .toList(),
                                          ),
                                        "quantity": double.parse(stock.text),
                                        "tax": tax.text,
                                        // "variationtype": variationval,
                                        "onsale": onsale,
                                        "description": pdescription.text,
                                        "featured": featured,
                                        "product_id": uuid.v1(),

                                        "pincode": pincode.text.split(','),
                                        // "discount": offerprice.text.isEmpty
                                        //     ? regularprice.text
                                        //     : offerprice.text,
                                        // "variation": variationlist.text.split(',')
                                      }, docid)
                                    : productsController.addProducts({
                                        // "variationtype" :
                                        "name": pname.text,
                                        "category": category,
                                        "photo_url": [url],
                                        "price": productsController.price
                                            .map((element) => {
                                                  'variation':
                                                      element.variation,
                                                  'mrp': element.price,
                                                  'offerprice':
                                                      element.offerprice
                                                })
                                            .toList(),
                                        "quantity": double.parse(stock.text),
                                        // "variationtype": variationval,
                                        "onsale": onsale,
                                        "description": pdescription.text,
                                        "featured": featured,
                                        "tax": tax.text,
                                        "product_id": uuid.v1(),

                                        "pincode": pincode.text.split(','),
                                        // "discount": offerprice.text.isEmpty
                                        //     ? regularprice.text
                                        //     : offerprice.text,
                                        // "variation": variationlist.text.split(',')
                                      });
                              },
=======
                              onPressed: (){
                                
                                isedit
                                  ? productsController.updateProducts({
                                      "name": pname.text,
                                      "category": category,
                                      "photo_url": [image],
                                      "price": productsController.price.map((element) => {'variation':element.variation,
                                      'mrp':element.price,
                                      'offerprice':element.offerprice}).toList(),
                                      "quantity": double.parse(stock.text),
                                      "tax": tax.text,
                                      // "variationtype": variationval,
                                      "onsale": onsale,
                                      "description": pdescription.text,
                                      "featured": featured,
                                      "product_id": uuid.v1(),

                                      "pincode": pincode.text.split(','),
                                      // "discount": offerprice.text.isEmpty
                                      //     ? regularprice.text
                                      //     : offerprice.text,
                                      // "variation": variationlist.text.split(',')
                                    }, docid)
                                  : productsController.addProducts({
                                      // "variationtype" :
                                      "name": pname.text,
                                      "category": category,
                                      "photo_url": [url],
                                      "price": productsController.price.map((element) => {'variation':element.variation,
                                      'mrp':element.price,
                                      'offerprice':element.offerprice}).toList(),
                                      "quantity": double.parse(stock.text),
                                      // "variationtype": variationval,
                                      "onsale": onsale,
                                      "description": pdescription.text,
                                      "featured": featured,
                                      "tax": tax.text,
                                      "product_id": uuid.v1(),

                                      "pincode": pincode.text.split(','),
                                      // "discount": offerprice.text.isEmpty
                                      //     ? regularprice.text
                                      //     : offerprice.text,
                                      // "variation": variationlist.text.split(',')
                                    });},
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
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
<<<<<<< HEAD
                ),
              ),
            ),
          );
        });
      },
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

  void uploadToStorage({fileName, state}) {
    final path = 'products/$fileName';
    uploadImage(onSelected: (file) {
      fb
          .storage()
          .refFromURL('gs://freshwheels-969bf.appspot.com/')
          .child(path)
          .put(file)
          .future
          .then((data) async {
        Uri uri = await data.ref.getDownloadURL();
        state(() {
          url = uri.toString();
        });
        Navigator.pop(Get.context);
      });
    });
  }
}

// class ExampleSource extends AdvancedDataTableSource<ProductModel> {
//   final List<ProductModel> data;
//   BuildContext context;
//   ExampleSource({this.data, this.context});

//   @override
//   DataRow getRow(int index) {
//     final currentRowData = lastDetails?.rows[index];
//     return DataRow(cells: [

//     ]);
//   }

class DataTableSourceExpedition extends DataTableSource {
  List<ProductModel> expeditions = [];
  Function onRowClicked;
  Function onDeleteIconClick;
  BuildContext context;

  DataTableSourceExpedition(
      {this.expeditions,
      this.onRowClicked,
      this.onDeleteIconClick,
      this.context});
  DataRow getRow(int index) {
    final currentRowData = expeditions[index];

    return DataRow.byIndex(
        index: index,
        cells: <DataCell>[
          DataCell(
            Text('${index + 1}'),
          ),
          DataCell(
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Are you sure'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Do you want to delete ${currentRowData.name} ?',
                                style: Theme.of(context).textTheme.subtitle1,
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
<<<<<<< HEAD
                                  children: [
                                    Text('MaxFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: maxfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'maxfee': maxfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Range Value : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: range,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'range': range.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                          usersFiltered == null || usersFiltered.length == 0
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.81,
                                  child: PaginatedDataTable(
                                    showCheckboxColumn: false,
                                    source: DataTableSourceExpedition(
                                      context: context,
                                      onRowClicked: (index) {
                                        var element = usersFiltered[index];
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddProducts(
                                                nameval: element.name,
                                                brandnameval: element.brand,
                                                desval: element.description,
                                                stockval: element.quantity
                                                    ?.toString(),
                                                onsale: element.onsale,
                                                featured: element.featured,
                                                offerpriceval: element
                                                    .offerprice
                                                    ?.toString(),
                                                category: element.category,
                                                variationval: element.variation,
                                                isedit: true,
                                                mrpval: element.mrp?.toString(),
                                                type: element.type,
                                                docid: element.docid,
                                                image: element.photo),
                                          ),
                                        );
                                      },
                                      expeditions: usersFiltered,
                                    ),
                                    showFirstLastButtons: true,
                                    rowsPerPage: rowsPerPage,
                                    availableRowsPerPage: [1, 5, 10, 50],
                                    onRowsPerPageChanged: (newRowsPerPage) {
                                      if (newRowsPerPage != null) {
                                        setState(() {
                                          rowsPerPage = newRowsPerPage;
                                        });
                                      }
                                    },

                                    columns: [
                                      DataColumn(
                                        label: Text('SI.No'),
                                      ),
                                      DataColumn(
                                        label: Text('Delete'),
                                      ),
                                      DataColumn(
                                        label: Text('Image'),
                                      ),
                                      DataColumn(
                                        label: Text('Name'),
                                      ),
                                      DataColumn(
                                        label: Text('Brand'),
                                      ),
                                      DataColumn(
                                        label: Text('Product ID'),
                                      ),
                                      DataColumn(
                                        label: Text('On sale'),
                                      ),
                                      DataColumn(
                                        label: Text('MRP'),
                                      ),
                                      DataColumn(
                                        label: Text('Offer Price'),
                                      ),
                                      DataColumn(
                                        label: Text('Type'),
                                      ),
                                      DataColumn(
                                        label: Text('Available Stock'),
                                      ),
                                      DataColumn(
                                        label: Text('Category'),
                                      ),
                                      DataColumn(
                                        label: Text('Description'),
                                      ),
                                    ],
                                    // rows:
                                  ),
                                ),
                        ],
                      ),
                    ),
=======
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
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
                                      onPressed: () {
                                        firebaseFirestore
                                            .collection('products')
                                            .doc(currentRowData.docid)
                                            .delete();
                                      },
                                      child: Text('Delete'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )),
          ),
          DataCell(
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) =>
                    Image.asset('assets/icons/loading.gif'),
                imageUrl: currentRowData.photoUrl[0],
                placeholder: (context, url) =>
                    Image.asset('assets/icons/loading.gif'),
                height: 70,
                width: 45,
              ),
            ),
          ),
          DataCell(
            Text(currentRowData.name),
          ),
          DataCell(Text('Click to View Price'), onTap: () {
            Get.dialog(AlertDialog(
              backgroundColor: bgColor,
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                DataTable(
                  rows: currentRowData.price
                      .map(
                        (element) => DataRow(
                          cells: [
                            DataCell(
                              Text(element.variation),
                            ),
                            DataCell(
                              Text(element.mrp),
                            ),
                            DataCell(
                              Text(element.offerprice),
                            )
                          ],
                        ),
                      )
                      .toList(),
                  columns: [
                    // DataColumn(
                    //   label: Text('SI.No'),
                    // ),
                    DataColumn(
                      label: Text('Variation'),
                    ),
                    DataColumn(
                      label: Text('MRP'),
                    ),
                    DataColumn(
                      label: Text('Offer Price'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PriceDetails(),
                          ),
                        );
                      },
                      child: Text('Add Price'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                    ),
                  ],
                ),
              ]),
            ));
          }),

          DataCell(Text(currentRowData.productId)),
          // DataCell(Text(currentRowData.price)),
          DataCell(Text(currentRowData.quantity.toString())),
          DataCell(Text(currentRowData.onsale.toString())),
          // DataCell(Text(currentRowData.offerprice)),
          DataCell(
            SizedBox(
              width: 200,
              child: Text(
                currentRowData.description,
                style: TextStyle(fontSize: 12.0),
                overflow: TextOverflow.ellipsis,
              ),
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
            ),
          ),
          DataCell(
            Text(currentRowData.category),
          ),
        ],
        onSelectChanged: (b) => onRowClicked(index));
  }

  bool get isRowCountApproximate => false;

=======
                ),
              ),
            ),
          );
        });
      },
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

  void uploadToStorage({fileName}) {
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
          url = uri.toString();
        });
        Navigator.pop(Get.context);
      });
    });
  }
}

<<<<<<< HEAD
class DataTableSourceExpedition extends DataTableSource {
  List<ProductModel> expeditions = [];
  Function onRowClicked;
  Function onDeleteIconClick;
  BuildContext context;

=======
// class ExampleSource extends AdvancedDataTableSource<ProductModel> {
//   final List<ProductModel> data;
//   BuildContext context;
//   ExampleSource({this.data, this.context});

//   @override
//   DataRow getRow(int index) {
//     final currentRowData = lastDetails?.rows[index];
//     return DataRow(cells: [

//     ]);
//   }

class DataTableSourceExpedition extends DataTableSource {
  List<ProductModel> expeditions = [];
  Function onRowClicked;
  Function onDeleteIconClick;
  BuildContext context;

>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
  DataTableSourceExpedition(
      {this.expeditions,
      this.onRowClicked,
      this.onDeleteIconClick,
      this.context});
  DataRow getRow(int index) {
    final currentRowData = expeditions[index];

    return DataRow.byIndex(
        index: index,
        cells: <DataCell>[
          DataCell(
            Text('${index + 1}'),
          ),
          DataCell(
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Are you sure'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Do you want to delete ${currentRowData.name} ?',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
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
                                      onPressed: () {
<<<<<<< HEAD
                                        Get.defaultDialog(
                                            title: "Loading...",
                                            content:
                                                CircularProgressIndicator(),
                                            barrierDismissible: false);
                                        firebaseFirestore
                                            .collection('products')
                                            .doc(currentRowData.docid)
                                            .delete()
                                            .then(
                                          (value) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                        );
=======
                                        firebaseFirestore
                                            .collection('products')
                                            .doc(currentRowData.docid)
                                            .delete();
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
                                      },
                                      child: Text('Delete'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )),
          ),
          DataCell(
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
<<<<<<< HEAD
                imageUrl: currentRowData.photo.first,
=======
                imageUrl: currentRowData.photo[0],
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
                placeholder: (context, url) =>
                    Image.asset('assets/icons/loading.gif'),
                height: 70,
                width: 45,
              ),
            ),
          ),
          DataCell(
            Text(currentRowData.name),
          ),
<<<<<<< HEAD
          DataCell(
            Text(currentRowData.brand),
          ),
          DataCell(
            Text(currentRowData.productid),
          ),
          DataCell(
            Text(
              currentRowData.onsale.toString(),
            ),
          ),
          DataCell(
            Text(
              currentRowData.mrp.toString(),
            ),
          ),
          DataCell(
            Text(
              currentRowData.offerprice.toString(),
            ),
          ),
          DataCell(
            Text(currentRowData.type),
          ),
          DataCell(
            Text(
              currentRowData.quantity.toString(),
            ),
          ),
          DataCell(
            Text(currentRowData.category),
          ),
=======
          DataCell(Text(currentRowData.productid)),
          // DataCell(Text(currentRowData.price)),
          DataCell(Text(currentRowData.quantity.toString())),
          DataCell(Text(currentRowData.onsale.toString())),
          DataCell(Text(currentRowData.offerprice)),
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
          DataCell(
            SizedBox(
              width: 200,
              child: Text(
                currentRowData.description,
                style: TextStyle(fontSize: 12.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
<<<<<<< HEAD
=======
          DataCell(
            Text(currentRowData.category),
          ),
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
        ],
        onSelectChanged: (b) => onRowClicked(index));
  }

  bool get isRowCountApproximate => false;

<<<<<<< HEAD
=======
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
  int get rowCount => expeditions.length;

  int get selectedRowCount => 0;
}

// class SearchField extends StatelessWidget {
//   const SearchField({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: "Search",
//         fillColor: secondaryColor,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//         ),
//         suffixIcon: InkWell(
//           onTap: () {},
//           child: Container(
//             padding: EdgeInsets.all(16.0 * 0.75),
//             margin: EdgeInsets.symmetric(horizontal: 16.0 / 2),
//             decoration: BoxDecoration(
//               color: primaryColor,
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//             child: SvgPicture.asset("assets/icons/Search.svg"),
//           ),
//         ),
//       ),
//     );
//   }
// }
// ---------------------------------------------------------------------------------------------------

// rows: usersFiltered
//                       .asMap()
//                       .map(
//                         (key, element) => MapEntry(
//                           key,
//                           DataRow(
//                               onSelectChanged: (value) {
//                                 String pincodestring =
//                                     element.pincode.toString();
//                                 buildShowDialog(
//                                     context: context,
//                                     taxval: element.tax,
//                                     nameval: element.name,
//                                     priceval: element.price.toString(),
//                                     desval: element.description,
//                                     pincodeval: pincodestring.substring(
//                                         1, pincodestring.length - 1),
//                                     stockval: element.quantity.toString(),
//                                     onsale: element.onsale,
//                                     featured: element.featured,
//                                     offerpriceval:
//                                         element.offerprice.toString(),
//                                     category: element.category,
//                                     variationval: element.variationtype,
//                                     rating: element.rating,
//                                     isedit: true,
//                                     variationlistval: element.variation
//                                         .toString()
//                                         .replaceAll('[', '')
//                                         .replaceAll(']', ''),
//                                     docid: element.docid,
//                                     image: element.photo[0]);
//                               },
//                               cells: [
//                                 DataCell(Text((key + 1).toString())),
//                                 DataCell(
//                                   IconButton(
//                                       icon: Icon(Icons.delete),
//                                       onPressed: () => showDialog(
//                                             context: context,
//                                             builder: (context) {
//                                               return AlertDialog(
//                                                 title: Text('Are you sure'),
//                                                 content: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   children: [
//                                                     Text(
//                                                       'Do you want to delete ${element.name} ?',
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .subtitle1,
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceEvenly,
//                                                         children: [
//                                                           ElevatedButton(
//                                                             onPressed: () {
//                                                               Navigator.pop(
//                                                                   context);
//                                                             },
//                                                             child:
//                                                                 Text('Cancel'),
//                                                             style: ButtonStyle(
//                                                               backgroundColor:
//                                                                   MaterialStateProperty
//                                                                       .all(
//                                                                           primaryColor),
//                                                             ),
//                                                           ),
//                                                           ElevatedButton(
//                                                             onPressed: () {
//                                                               firebaseFirestore
//                                                                   .collection(
//                                                                       'products')
//                                                                   .doc(element
//                                                                       .docid)
//                                                                   .delete();
//                                                             },
//                                                             child:
//                                                                 Text('Delete'),
//                                                             style: ButtonStyle(
//                                                               backgroundColor:
//                                                                   MaterialStateProperty
//                                                                       .all(
//                                                                           primaryColor),
//                                                             ),
//                                                           )
//                                                         ],
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                           )),
//                                 ),
//                                 DataCell(
//                                   Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Image.network(
//                                       element.photo[0],
//                                       height: 70,
//                                       width: 70,
//                                     ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Text(element.name),
//                                 ),
//                                 DataCell(Text(element.productid)),
//                                 DataCell(Text(element.price)),
//                                 DataCell(Text(element.quantity.toString())),
//                                 DataCell(Text(element.onsale.toString())),
//                                 DataCell(Text(element.offerprice)),
//                                 DataCell(
//                                   SizedBox(
//                                     width: 200,
//                                     child: Text(
//                                       element.description,
//                                       style: TextStyle(fontSize: 12.0),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Text(element.category),
//                                 ),
//                               ]),
//                         ),
//                       )
//                       .values
//                       .toList(),
