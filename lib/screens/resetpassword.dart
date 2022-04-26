import 'package:chownow/controller/put/passwordreset.dart';
import 'package:chownow/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({Key? key}) : super(key: key);

  @override
  _ResetpasswordState createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  TextEditingController password = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 470,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reset Password',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Email'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: otp,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Token'),
                  ),
                  SizedBox(
                    height: 20,
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
                      PasswordReset.resetpassword(
                              email: email.text,
                              password: password.text,
                              token: otp.text)
                          .then((v) {
                        Navigator.pop(context);
                        Future.delayed(Duration(seconds: 2), () {
                          Get.offAll(() => LoginScreen());
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Success'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        'Your password has been changed, please continue login with your new password. This page will automatically redirect you to the login screen in 2 seconds'),
                                  ],
                                ),
                              );
                            });
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          // color: ColorConstants.buttonColors,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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
    );
  }
}
