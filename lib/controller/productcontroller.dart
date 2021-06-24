import 'dart:async';
import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProducsController extends GetxController {
  static ProducsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  // RxList<ProductModel> productsFiltered = products;
  RxList<ProductModel> categorisedproducts = RxList<ProductModel>([]);
  // String collection = "products";
  RxList<CategoryModel> categories = RxList([]);
  RxList carousel = RxList([]);

  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
    categories.bindStream(getCategoryLists());
    carousel.bindStream(getCarousalLists());
  }

  Stream<List<CategoryModel>> getCategoryLists() => firebaseFirestore
      .collection('category')
      .doc('categories')
      .snapshots()
      .map((query) => _convertcategories(query.get('categories'), query.id));

  List<CategoryModel> _convertcategories(List cartFomDb, docid) {
    List<CategoryModel> _result = [];
    if (cartFomDb.length > 0) {
      cartFomDb.forEach((element) {
        _result.add(CategoryModel.fromMap(element, docid));
      });
    }
    return _result;
  }

  Stream<List> getCarousalLists() => firebaseFirestore
      .collection('category')
      .doc('carousel')
      .snapshots()
      .map((query) => query.get('photourl'));

  Stream<List<ProductModel>> getAllProducts() => firebaseFirestore
      .collection("products")
      .orderBy('quantity')
      .snapshots()
      .map((query) => query.docs
          .map((item) => ProductModel.fromMap(item.data(), item.id))
          .toList());

  addProducts(data) {
    showDialog(
        context: Get.context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [CircularProgressIndicator(), Text('Loading...')]),
          );
        });
    firebaseFirestore.collection('products').add(data).whenComplete(() {
      Navigator.pop(Get.context);
      Navigator.pop(Get.context);
    });
  }

  updateProducts(data, docid) {
    showDialog(
        context: Get.context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [CircularProgressIndicator(), Text('Loading...')]),
          );
        });
    firebaseFirestore
        .collection('products')
        .doc(docid)
        .update(data)
        .whenComplete(() {
      Navigator.pop(Get.context);
      Navigator.pop(Get.context);
    });
  }
}
