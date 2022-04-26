import 'package:chownow/constants/colors.dart';
import 'package:chownow/controller/put/passwordreset.dart';
import 'package:chownow/screens/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                        color: primarycolor,
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
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // TextFormField(
                  //   controller: password,
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8.0),
                  //       ),
                  //       labelText: 'Password'),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // TextFormField(
                  //   controller: otp,
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8.0),
                  //       ),
                  //       labelText: 'Token'),
                  // ),
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
                      print(email.text);
                      PasswordReset.sendmail(email: email.text).then((v) {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Success'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        'You will receive an email with a token value in a few minutes. Please enter the token value in the next screen'),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Get.offAll(() => Resetpassword());
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }, onError: (v) {
                        Navigator.pop(context);
                        Get.rawSnackbar(title: 'Error', message: v);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          color: primarycolor,
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
