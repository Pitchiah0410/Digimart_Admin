// import 'dart:js' as js;
import 'package:chownow/constants/colors.dart';
import 'package:chownow/constants/controller.dart';
import 'package:chownow/constants/images.dart';
import 'package:chownow/controller/post/businesslogin.dart';
import 'package:chownow/controller/post/businessregistration.dart';
import 'package:chownow/screens/forgotpassword.dart';
import 'package:chownow/screens/landing.dart';
import 'package:chownow/screens/location.dart';
import 'package:chownow/screens/navigation.dart';
import 'package:chownow/screens/timing.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nanoid/async.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignUp = false;
  bool isPicked = false;
  var imagefile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(subscriptionController);
  }

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController businessCode = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: size.width > 1035
            ? Row(
                children: [
                  SizedBox(
                    width: size.width * 0.55,
                    child: SingleChildScrollView(
                      child: !isSignUp
                          ? Signin(size.width * 0.30)
                          : SignUp(size.width * 0.20),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.45,
                    child: Stack(
                      children: [
                        Container(
                          color: loginscreen,
                        ),
                        Positioned(
                          bottom: 25,
                          left: 35,
                          child: SvgPicture.asset(login,
                              height: 300, fit: BoxFit.contain),
                        ),
                        Positioned(
                          top: 45.0,
                          right: 25.0,
                          child: SizedBox(
                            width: 250,
                            child: Text(
                              'Every day is a good day for your restaurant.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: !isSignUp
                    ? Signin(size.width * 0.80)
                    : SignUp(size.width * 0.465),
              ),
      ),
    );
  }

  Widget Signin(size) {
    return Column(
      children: [
        SizedBox(
          height: 25.0,
        ),
        RichText(
          text: TextSpan(
              text: 'GoMo',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primarycolor,
              ),
              children: [
                TextSpan(
                  text: 'Bites',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                )
              ]),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Welcome Back',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        SizedBox(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        SizedBox(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularProgressIndicator(),
                                    Text('Please Wait Loading...')
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                  BusinessLoginController.businesslogin(
                          email: email.text, password: password.text)
                      .then((value) {
                    Navigator.pop(context);
                    Get.offAll(() => NavigationPage());
                  }, onError: (e) {
                    Navigator.pop(context);
                    Get.rawSnackbar(message: e);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: primarycolor,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 50,
                  width: size,
                  child: Center(
                    child: Text(
                      'Log in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            child: Text('Forgot your password?'),
            onPressed: () {
              navigator!.push(
                MaterialPageRoute(
                  builder: (context) => ForgotPassword(),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: size,
          child: Divider(),
        ),
        SizedBox(
          height: 10.0,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            child: RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
                children: [
                  TextSpan(
                      text: 'Sign up', style: TextStyle(color: primarycolor)),
                ],
              ),
            ),
            onPressed: () {
              setState(() {
                isSignUp = true;
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            child: RichText(
              text: TextSpan(
                text: "Go to Home Page ",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            onPressed: () {
              launch('http://gomobites.com/');
              // js.context.callMethod('open', ['http://gomobites.com/']);
            },
          ),
        ),
      ],
    );
  }

  showpasswordreset(bool reset) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog();
        });
  }

  Widget SignUp(double size) {
    return Obx(
      () {
        if (subscriptionController.subscription.value.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          RxString? selectedsubscription = subscriptionController
              .subscription.value.data!.first.subscriptionId!.obs;
          return Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              RichText(
                text: TextSpan(
                    text: 'GoMo',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: primarycolor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Bites',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Explore New Opportunities! Register Now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: firstName,
                          decoration: InputDecoration(
                              hintText: 'First Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: size,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: lastName,
                          decoration: InputDecoration(
                              hintText: 'Last Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Restaurant Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: businessName,
                          decoration: InputDecoration(
                              hintText: 'Restaurant Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: size,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Brand Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: businessCode,
                          decoration: InputDecoration(
                              hintText: 'Brand Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: size,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mobile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: mobile,
                          decoration: InputDecoration(
                              hintText: 'Mobile',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: size,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: passwordconfirm,
                          decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Image',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          readOnly: true,
                          onTap: () async {
                            FilePickerResult? picked = await FilePicker.platform
                                .pickFiles(
                                    allowMultiple: false,
                                    allowCompression: false);

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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: size * 0.75,
                    child: isPicked
                        ? Image.memory(
                            imagefile.bytes,
                            fit: BoxFit.fitWidth,
                            // width: size,
                          )
                        : FadeInImage.assetNetwork(
                            placeholder: 'assets/loading.gif',
                            image: 'assets/loading.gif',
                            fit: BoxFit.fitWidth,
                            // width: size,
                          ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              InkWell(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularProgressIndicator(),
                                    Text('Please Wait Loading...')
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                  // Get.offAll(() => LocationPage());
                  BusinessRegistrationController.businessregistration(
                    image: imagefile!,
                    firstName: firstName.text,
                    lastName: lastName.text,
                    businessName: businessName.text,
                    email: email.text,
                    mobile: mobile.text,
                    subscriptionId: selectedsubscription.value,
                    productCode: 'RESTAURANT_MANAGEMENT',
                    businessCode: businessCode.text,
                    password: password.text,
                  )
                      // openingHours: openingHours.text,
                      // closingHours: closingHours.text)
                      .then(
                    (value) => Get.offAll(() => TimingPage()),
                    onError: (e) => Get.rawSnackbar(message: e),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: primarycolor,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 50,
                  width: size,
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: size,
                child: Divider(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  child: RichText(
                    text: TextSpan(
                      text: "Already Have an Account? ",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                      children: [
                        TextSpan(
                            text: 'Sign in',
                            style: TextStyle(color: primarycolor)),
                      ],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isSignUp = false;
                    });
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
