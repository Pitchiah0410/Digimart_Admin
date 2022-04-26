import 'package:chownow/constants/colors.dart';
import 'package:chownow/screens/addproduct.dart';
import 'package:chownow/screens/categories.dart';
import 'package:chownow/screens/dashboard.dart';
import 'package:chownow/screens/orderslist.dart';
import 'package:chownow/screens/products.dart';
import 'package:chownow/screens/users.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    // DashBoard(),
    OrdersPage(),
    FoodItems(),
    CategoryPage(),
    AddProduct(),
    UsersPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseOnMessage();
    firebaseOnMessageOpenedApp();
  }

  void firebaseOnMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {});
  }

  void firebaseOnMessage() {
    FirebaseMessaging.onMessage.listen((event) {
      if (event != null) {
        final title = event.notification!.title;
        final body = event.notification!.body;
        Get.rawSnackbar(title: title, message: body);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              minWidth: MediaQuery.of(context).size.width > 1035 ? 72 : 62,
              trailing: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child:
                    // Column(
                    // children: [
                    IconButton(
                  onPressed: () async {
                    Future<SharedPreferences> _prefs =
                        SharedPreferences.getInstance();
                    final SharedPreferences prefs = await _prefs;
                    prefs.setString('token', 'null').then(
                          (value) => Get.offAll(
                            () => LoginScreen(),
                          ),
                        );
                  },
                  icon: Icon(Icons.exit_to_app),
                ),
                //   Text(
                //     'Logout',
                //   )
                // ],
                // ),
              ),
              leading: MediaQuery.of(context).size.width > 1035
                  ? RichText(
                      text: TextSpan(
                          text: 'Gomo',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primarycolor,
                          ),
                          children: [
                            TextSpan(
                              text: 'Bites',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            )
                          ]),
                    )
                  : Container(),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: MediaQuery.of(context).size.width > 750
                  ? NavigationRailLabelType.all
                  : NavigationRailLabelType.none,
              destinations: const <NavigationRailDestination>[
                // NavigationRailDestination(
                //   icon: Icon(Icons.bookmark_border),
                //   selectedIcon: Icon(Icons.book),
                //   label: Text('DashBoard'),
                // ),
                NavigationRailDestination(
                  icon: Icon(Icons.line_style_rounded),
                  selectedIcon: Icon(Icons.line_style_rounded),
                  label: Text('Orders'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.food_bank_outlined),
                  selectedIcon: Icon(Icons.food_bank_rounded),
                  label: Text('Foods'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.list_alt_outlined),
                  selectedIcon: Icon(Icons.list_alt),
                  label: Text('Categories'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add_to_photos_outlined),
                  selectedIcon: Icon(Icons.add_to_photos),
                  label: Text('Add Products'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Users'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(child: pages[_selectedIndex])
          ],
        ),
      ),
    );
  }
}
