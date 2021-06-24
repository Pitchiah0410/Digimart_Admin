import 'dart:async';
import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:digimartadmin/models/ordermodel.dart';
import 'package:digimartadmin/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  RxList<UserModel> users = RxList<UserModel>([]);
  RxInt pageindex = 0.obs;
  final PageController controller = PageController(initialPage: 0);
  String collection = "users";

  @override
  onReady() {
    super.onReady();
    users.bindStream(getAllUsers());
  }

  Stream<List<UserModel>> getAllUsers() =>
      firebaseFirestore.collection('users').snapshots().map((query) =>
          query.docs.map((item) => UserModel.fromSnapshot(item)).toList());

  upadateUser(OrderModel order, String status) {
    firebaseFirestore
        .collection('users')
        .doc(order.userId)
        .collection('orders')
        .doc(order.docId)
        .update({'deliverystatus': status});

         firebaseFirestore
        .collection('orders').doc(order.id).update({'deliverystatus': status});
  }
}
