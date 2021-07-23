import 'package:digimartadmin/constants.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:digimartadmin/screens/category/categories.dart';
import 'package:digimartadmin/screens/dashboard/widgets/dashordwidget.dart';
import 'package:digimartadmin/screens/offers/offersPage.dart';
import 'package:digimartadmin/screens/orders/ordersPage.dart';
import 'package:digimartadmin/screens/products/products.dart';
import 'package:digimartadmin/screens/users/userspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/responsive.dart';
import 'widgets/sidemenu.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Scaffold(
            // key: context.read<MenuController>().scaffoldKey,

            body: SafeArea(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                if (Responsive.isDesktop(context))
                  Expanded(
                    child: SideMenu(),
                  ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  flex: 5,
                  child: PageView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (value) {
                        userController.pageindex.value = value;
                      },
                      controller: userController.controller,
                      children: [
                        DashboardScreen(),
                        ProductsScreen(),
                        CategoriesPage(),
                        OrdersPage(),
                        OffersPage(),
                        UsersPage()
                      ]),
                ),
              ]),
            ),
          )
        : Scaffold(
            // key: context.read<MenuController>().scaffoldKey,
            appBar: AppBar(
                title: Text('Dashboard'),
                elevation: 0,
                backgroundColor: bgColor),
            drawer: SideMenu(),
            body: SafeArea(
              child: PageView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    userController.pageindex.value = value;
                  },
                  controller: userController.controller,
                  children: [
                    DashboardScreen(),
                    ProductsScreen(),
                    CategoriesPage(),
                    OrdersPage(),
                    OffersPage(),
                    UsersPage()
                  ]),
            ),
          );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           NavigationRail(
//             backgroundColor: bgColor,
//             extended: true,
//             destinations: [
//               NavigationRailDestination(
//                 icon: Icon(Icons.dashboard_outlined),
//                 selectedIcon: Icon(Icons.dashboard),
//                 label: Text('Dashboard'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.shopping_bag_outlined),
//                 selectedIcon: Icon(Icons.shopping_bag),
//                 label: Text('Products'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.category_outlined),
//                 selectedIcon: Icon(Icons.category),
//                 label: Text('Category'),
//               ),
//             ],
//             selectedIndex: _selectedIndex,
//             onDestinationSelected: (int index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             labelType: NavigationRailLabelType.none,
//           ),
//           const VerticalDivider(thickness: 1, width: 1),
//           // This is the main content.
//           Expanded(
//               child: _selectedIndex == 0
//                   ? DashboardScreen()
//                   : _selectedIndex == 1
//                       ? ProductsScreen()
//                       : CategoriesPage())
//         ],
//       ),
//     );
//   }
// }
