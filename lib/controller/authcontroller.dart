import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/screens/dashboard/dashboard.dart';
import 'package:digimartadmin/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    ever(firebaseUser, _setInitialScreen);
    print(firebaseUser);
  }

  _setInitialScreen(User user) async {
    if (user == null) {
      print(firebaseUser);
      Get.offAll(() => LoginPage());
    } else {
      print(firebaseUser);
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
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
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
