import 'dart:async';
import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/models/ordermodel.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  RxList<OrderModel> orders = RxList<OrderModel>([]);
  OrderConfigModel ordercongig = OrderConfigModel();
  String collection = "orders";

  @override
  onReady() async {
    super.onReady();
    orders.bindStream(getAllOrders());
    ordercongig = await getorderconfigs();
  }

  Stream<List<OrderModel>> getAllOrders() => firebaseFirestore
      .collection('orders')
      .orderBy('datetime', descending: true)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => OrderModel.fromMap(item.data())).toList());

  Future<OrderConfigModel> getorderconfigs() async => await firebaseFirestore
      .collection('settings')
      .doc('deliveryoptions')
      .get()
      .then((value) => OrderConfigModel.fromMap(value.data()));
}
