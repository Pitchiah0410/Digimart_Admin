import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/controller/productcontroller.dart';
import 'package:digimartadmin/controller/usercntroller.dart';
import 'package:digimartadmin/screens/dashboard/dashboard.dart';
import 'package:digimartadmin/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ordercontroller.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User> firebaseUser;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    _setInitialScreen(firebaseUser.value);
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User user) async {
    if (user == null) {
      print(user);
      Get.offAll(() => LoginPage());
    } else {
      print(user);
      Get.put(UserController());
      Get.put(OrderController());
      Get.put(ProducsController());
      Get.offAll(() => MyHomePage());
    }
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _clearControllers();
      });
    } on FirebaseAuthException catch (e) {
      print(e.code);

      dismissLoadingWidget();

      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", e.code);
    }
  }

  _clearControllers() {
    email.clear();
    password.clear();
  }

  showLoading() {
    Get.defaultDialog(
        title: "Loading...",
        content: CircularProgressIndicator(),
        barrierDismissible: false);
  }

  dismissLoadingWidget() {
    Get.back();
  }
}
