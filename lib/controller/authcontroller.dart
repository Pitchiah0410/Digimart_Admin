import 'package:digimartadmin/constants/constants.dart';
<<<<<<< HEAD
import 'package:digimartadmin/controller/productcontroller.dart';
import 'package:digimartadmin/controller/usercntroller.dart';
=======
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
import 'package:digimartadmin/screens/dashboard/dashboard.dart';
import 'package:digimartadmin/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

<<<<<<< HEAD
import 'ordercontroller.dart';

=======
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
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
<<<<<<< HEAD
    _setInitialScreen(firebaseUser.value);
    ever(firebaseUser, _setInitialScreen);
=======
    ever(firebaseUser, _setInitialScreen);
    print(firebaseUser);
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
  }

  _setInitialScreen(User user) async {
    if (user == null) {
<<<<<<< HEAD
      print(user);
      Get.offAll(() => LoginPage());
    } else {
      print(user);
      Get.put(UserController());
      Get.put(OrderController());
      Get.put(ProducsController());
=======
      print(firebaseUser);
      Get.offAll(() => LoginPage());
    } else {
      print(firebaseUser);
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
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
<<<<<<< HEAD
    } on FirebaseAuthException catch (e) {
      print(e.code);

      dismissLoadingWidget();

      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", e.code);
=======
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
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
