// import 'dart:io';

import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chownow/controller/post/categoryController.dart';
import 'package:chownow/controller/post/productsController.dart';
import 'package:chownow/model/categorymodel.dart' as catmodel;
import 'package:chownow/model/subcategorymodel.dart' as subcatmodel;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid/async.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isTaxable = false;
  bool isPicked = false;
  late PlatformFile imagefile;
  RxString subCategoryId = RxString('');
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController tag = TextEditingController();
  var cat;
  List<subcatmodel.Datum> subcat = [];
  String categoryId = '';
  @override
  initState() {
    super.initState();
    getcat();
  }

  getcat() async {
    cat = [];
    var catdata = await CategoryController.getCategory();
    var subcatdata = await CategoryController.getSubCategory(
        catid: catdata.data!.first.categoryId);
    setState(() {
      cat = catdata.data;
      print(cat);
      subcat = subcatdata.data!.isEmpty ? [] : subcatdata.data!;
      categoryId = cat.isEmpty ? 'no data' : cat.first.categoryId!;
      subCategoryId.value =
          subcat.isEmpty ? 'no data' : subcat.first.subCategoryId!;
    });
    print(categoryId);
    print(
      cat.map((e) => e.categoryId).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (cat == null || cat.isEmpty || subcat.isEmpty) {
      print(cat);
      print(subcat);
      return Center(
          child: Text(
        'Please Add Category to Continue',
        style: Theme.of(context).textTheme.headline3,
      ));
      // } else if () {
      //   Future.delayed(Duration(seconds: 10), () {
      //     setState(() {
      //       cat = null;
      //     });
      //   });
      //   return Center(
      //     child: CircularProgressIndicator(),
      //   );
    } else {
      return size.width > 1035
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add Product',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Product Name',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: name,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Price',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: price,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Discount',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: discount,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Tags',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: tag,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Select Category',
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField<
                                                dynamic>(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onChanged: (v) async {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text('Loading ...'),
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator())
                                                          ],
                                                        ),
                                                      );
                                                    });
                                                categoryId = v!;
                                                await CategoryController
                                                        .getSubCategory(
                                                            catid: v)
                                                    .then((value) {
                                                  setState(() {
                                                    subcat = value.data!;
                                                    subCategoryId.value = subcat
                                                        .first.subCategoryId!;
                                                  });
                                                  Navigator.pop(context);
                                                });
                                              },
                                              value: categoryId,
                                              items: cat.isEmpty
                                                  ? [
                                                      DropdownMenuItem(
                                                        child: Text(
                                                            'Please Create Categories'),
                                                        value: 'no data',
                                                      )
                                                    ]
                                                  : cat
                                                      .map<
                                                          DropdownMenuItem<
                                                              dynamic>>((e) =>
                                                          DropdownMenuItem(
                                                            child:
                                                                Text(e.name!),
                                                            value: e.categoryId,
                                                          ))
                                                      .toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Select SubCategory',
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField<
                                                dynamic>(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onChanged: (v) {
                                                setState(() async {
                                                  subCategoryId.value = v!;
                                                  print(v);
                                                });
                                              },
                                              value: subCategoryId.value,
                                              items: subcat.isEmpty
                                                  ? [
                                                      DropdownMenuItem(
                                                        child: Text(
                                                            'Please Create SubCategories'),
                                                        value: 'no data',
                                                      )
                                                    ]
                                                  : subcat
                                                      .map<
                                                          DropdownMenuItem<
                                                              dynamic>>((val) =>
                                                          DropdownMenuItem(
                                                            child:
                                                                Text(val.name!),
                                                            value: val
                                                                .subCategoryId,
                                                          ))
                                                      .toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Is Taxable',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField<bool>(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onChanged: (bool? v) =>
                                                setState(() => isTaxable = v!),
                                            value: isTaxable,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text('Yes'),
                                                value: true,
                                              ),
                                              DropdownMenuItem(
                                                child: Text('No'),
                                                value: false,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                isTaxable
                                    ? Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Tax Amount',
                                                style: TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: tax,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Product Image',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                readOnly: true,
                                onTap: () async {
                                  // uploadImage(onSelected: (file) {
                                  //   imagefile = file;
                                  // });
                                  FilePickerResult? picked =
                                      await FilePicker.platform.pickFiles(
                                          allowMultiple: false,
                                          allowCompression: false);
                                  // .whenComplete(
                                  //   () => Navigator.pop(context),
                                  // );
                                  if (picked != null) {
                                    imagefile = picked.files.first;
                                    setState(() {
                                      isPicked = true;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Upload Images',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Product',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            isPicked
                                ? Center(
                                    child: Image.memory(
                                      imagefile.bytes!,
                                      fit: BoxFit.fitWidth,
                                      width: size.width * 0.35,
                                    ),
                                  )
                                : Center(
                                    child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/loading.gif',
                                      image: 'assets/loading.gif',
                                      fit: BoxFit.fitWidth,
                                      width: size.width * 0.35,
                                    ),
                                  ),
                            // CarouselSlider(
                            //   items: imglist
                            //       .map(
                            //         (e) => FadeInImage.assetNetwork(
                            //           placeholder: 'assets/loading.gif',
                            //           image: e,
                            //           height: size.height * 0.30,
                            //           // fit: BoxFit.fitWidth,
                            //         ),
                            //       )
                            //       .toList(),
                            //   FadeInImage.assetNetwork(
                            //     placeholder: 'assets/loading.gif',
                            //     image: 'https://picsum.photos/250?image=9',
                            //     fit: BoxFit.fitWidth,
                            //   ),
                            //   FadeInImage.assetNetwork(
                            //     placeholder: 'assets/loading.gif',
                            //     image: 'https://picsum.photos/250?image=9',
                            //     fit: BoxFit.fitWidth,
                            //   )
                            // ],
                            // options: CarouselOptions(
                            //     autoPlay: true,
                            //     enlargeCenterPage: true,
                            //     aspectRatio: 2.0,
                            //     onPageChanged: (index, reason) {
                            //       setState(() {
                            //         _current = index;
                            //       });
                            //     }),
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: imglist.asMap().entries.map((entry) {
                            //     return GestureDetector(
                            //       onTap: () => _controller.animateToPage(entry.key),
                            //       child: Container(
                            //         width: 12.0,
                            //         height: 12.0,
                            //         margin: EdgeInsets.symmetric(
                            //             vertical: 8.0, horizontal: 4.0),
                            //         decoration: BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             color: (Theme.of(context).brightness ==
                            //                         Brightness.dark
                            //                     ? Colors.white
                            //                     : Colors.black)
                            //                 .withOpacity(
                            //                     _current == entry.key ? 0.9 : 0.4)),
                            //       ),
                            //     );
                            //   }).toList(),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                minLines: 5,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text('Loading ...'),
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                  ],
                                                ),
                                              );
                                            });
                                        print(imagefile.bytes);
                                        ProductsController.createProduct(
                                                image: imagefile,
                                                name: name.text,
                                                categoryId: categoryId,
                                                subCategoryId:
                                                    subCategoryId.value,
                                                description: description.text,
                                                itemCode: 'dewf34',
                                                discount: discount.text,
                                                price: price.text,
                                                isTaxable: isTaxable ? 1 : 0,
                                                tax: tax.text,
                                                tags: tag.text.split(','))
                                            .then((value) {
                                          name.clear();
                                          description.clear();
                                          price.clear();
                                          tax.clear();
                                          tag.clear();
                                          discount.clear();
                                          categoryId = '';
                                          subCategoryId.value = '';
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Submit'),
                                      ))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Card(
              color: Colors.white,
              elevation: 5,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Add Product',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Product Name',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: price,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Discount',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: discount,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Tags',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: tag,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Select Category',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<dynamic>(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onChanged: (v) async {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text('Loading ...'),
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                  ],
                                                ),
                                              );
                                            });
                                        categoryId = v!;
                                        await CategoryController.getSubCategory(
                                                catid: v)
                                            .then((value) {
                                          setState(() {
                                            subcat = value.data!;
                                            subCategoryId.value =
                                                subcat.first.subCategoryId!;
                                          });
                                          Navigator.pop(context);
                                        });
                                      },
                                      value: categoryId,
                                      items:
                                          // cat.isEmpty
                                          //     ? [
                                          //         DropdownMenuItem(
                                          //           child: Text(
                                          //               'Please Create Categories'),
                                          //           value: 'no data',
                                          //         )
                                          //       ]
                                          //     :
                                          cat
                                              .map<DropdownMenuItem<dynamic>>(
                                                  (e) => DropdownMenuItem(
                                                        child: Text(e.name!),
                                                        value: e.categoryId,
                                                      ))
                                              .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Select SubCategory',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<dynamic>(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onChanged: (v) {
                                        setState(() async {
                                          subCategoryId.value = v!;
                                          print(v);
                                        });
                                      },
                                      value: subCategoryId.value,
                                      items:
                                          // subcat.isEmpty
                                          //     ? [
                                          //         DropdownMenuItem(
                                          //           child: Text(
                                          //               'Please Create SubCategories'),
                                          //           value: 'no data',
                                          //         )
                                          //       ]
                                          //     :
                                          subcat
                                              .map<DropdownMenuItem<dynamic>>(
                                                  (val) => DropdownMenuItem(
                                                        child: Text(val.name!),
                                                        value:
                                                            val.subCategoryId,
                                                      ))
                                              .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Is Taxable',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<bool>(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onChanged: (bool? v) =>
                                        setState(() => isTaxable = v!),
                                    value: isTaxable,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Yes'),
                                        value: true,
                                      ),
                                      DropdownMenuItem(
                                        child: Text('No'),
                                        value: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        isTaxable
                            ? Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Tax Amount',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: tax,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Product Image',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          FilePickerResult? picked = await FilePicker.platform
                              .pickFiles(
                                  allowMultiple: false,
                                  allowCompression: false);

                          if (picked != null) {
                            setState(() {
                              isPicked = true;
                              imagefile = picked.files.first;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Upload Images',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Product',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    isPicked
                        ? Center(
                            child: Image.file(
                              File(imagefile.path),
                            ),
                            // Image.memory(
                            //   imagefile.bytes!,
                            //   fit: BoxFit.fitWidth,
                            //   width: size.width * 0.75,
                            // ),
                          )
                        : Center(
                            child: Image.asset(
                              'assets/loading.gif',
                              fit: BoxFit.fitWidth,
                              width: size.width * 0.75,
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        minLines: 5,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () async {
                                print('Inside API Call');
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Loading ...'),
                                            Center(
                                                child:
                                                    CircularProgressIndicator())
                                          ],
                                        ),
                                      );
                                    });
                                ProductsController.createProduct(
                                        image: imagefile,
                                        name: name.text,
                                        categoryId: categoryId,
                                        subCategoryId: subCategoryId.value,
                                        description: description.text,
                                        itemCode: 'dewf34',
                                        discount: discount.text.isEmpty
                                            ? '0'
                                            : discount.text,
                                        price: price.text.isEmpty
                                            ? '0'
                                            : price.text,
                                        isTaxable: isTaxable ? 1 : 0,
                                        tax: tax.text.isEmpty ? '0' : tax.text,
                                        tags: tag.text.split(','))
                                    .then((value) {
                                  name.clear();
                                  description.clear();
                                  price.clear();
                                  tax.clear();
                                  tag.clear();
                                  discount.clear();
                                  // categoryId = '';
                                  // subCategoryId.value = '';
                                  Navigator.pop(context);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Submit'),
                              ))),
                    )
                  ],
                ),
              ),
            );
    }

    // int _current = 0;
    // final CarouselController _controller = CarouselController();
    // List imglist = [
    //   'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
    //   'https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2016/10/foodJointPainRelief-142336977-770x533-1-650x428.jpg',
    //   'http://cdn.cnn.com/cnnnext/dam/assets/140430115517-06-comfort-foods.jpg',
    // ];
  }
}
