import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/models/ordermodel.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  RxList<OrderModel> orders = RxList<OrderModel>([]);
  OrderConfigModel ordercongig = OrderConfigModel();
  String collection = "orders";
  int _perpagelimit = 10;
  // RxBool loadingorders = true.obs;
  RxBool gettingmoreproducts = false.obs;
  RxBool moreproductsavailable = true.obs;
  Rx<QueryDocumentSnapshot> lastdocument;

  @override
  onReady() async {
    super.onReady();
    orders.bindStream(getAllOrders());
    ordercongig = await getorderconfigs();
    // getAllOrders();
  }

  // getAllOrders() async { 
  // //  Query q =  firebaseFirestore
  // //     .collection('orders')
  // //     .orderBy('datetime', descending: true).limit(_perpagelimit);
  // //     loadingorders.value = true;
  // //    QuerySnapshot querySnapshot = await q.get();
  // //    orders.value = querySnapshot.docs.map((item) => OrderModel.fromMap(item.data(), item.id)).toList();
  // //    lastdocument = querySnapshot.docs[querySnapshot.docs.length-1].obs;
  // //    loadingorders.value = false;
        
  //       }
 Stream<List<OrderModel>> getAllOrders() => firebaseFirestore
      .collection('orders')
      .orderBy('datetime', descending: true).limit(_perpagelimit)
      .snapshots()
      .map((query) {lastdocument = query.docs[query.docs.length-1].obs;
          return query.docs.map((item) => OrderModel.fromMap(item.data(), item.id)).toList();});


  // Stream<List<OrderModel>> getmoreOrders() => firebaseFirestore
  //     .collection('orders')
  //     .orderBy('datetime', descending: true).limit(_perpagelimit)
  //     .snapshots()
  //     .map((query) {lastdocument = query.docs[query.docs.length-1].obs;
  //         return query.docs.map((item) => OrderModel.fromMap(item.data(), item.id)).toList();});




  //         getmoreOrders() async{ 
  //           print('Loading More Products');
  // Query q =  firebaseFirestore
  //     .collection('orders')
  //     .orderBy('datetime', descending: true).startAfter([lastdocument.value.get('datetime')]).limit(_perpagelimit);
  //    QuerySnapshot querySnapshot = await q.get();

  //    if(querySnapshot.docs.length< _perpagelimit){
  //      moreproductsavailable.value = false;
  //    }
  //    orders.addAll(querySnapshot.docs.map((item) => OrderModel.fromMap(item.data(),item.id)).toList());
  //    lastdocument = querySnapshot.docs[querySnapshot.docs.length-1].obs;
  //    loadingorders.value = false;
        
  //       }


  Future<OrderConfigModel> getorderconfigs() async => await firebaseFirestore
      .collection('settings')
      .doc('deliveryoptions')
      .get()
      .then((value) => OrderConfigModel.fromMap(value.data()));
}
