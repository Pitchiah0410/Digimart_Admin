import 'package:digimartadmin/constants.dart';
import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:digimartadmin/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/responsive.dart';
import 'card.dart';
import 'header.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> status = [
    'Order Placed',
    'Order Recieved',
    'Order Delivered',
    'Cancelled'
  ];
  loading() {
    Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          SizedBox(height: 16.0),
          Responsivecard(),
          Obx(
            () => 
            // orderController.orders.isEmpty
                // ? loading():
                 _size.width > 650
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              // height: 350,
                              child: Card(
                                color: secondaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Recent Orders',
                                          style: Theme.of(context)
                                              .textTheme
                                              .title),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: orderController.orders
                                                    .where((v) =>
                                                        v.status ==
                                                        'Order Placed')
                                                    .toList()
                                                    .length >
                                                6
                                            ? 6
                                            : orderController.orders
                                                .where((v) =>
                                                    v.status == 'Order Placed')
                                                .toList()
                                                .length,
                                        itemBuilder: (context, index) {
                                          String formattedDate =
                                              DateFormat('EEE, d-M-y | hh:mm')
                                                  .format(orderController
                                                      .orders[index].datetime
                                                      .toDate());
                                          return Card(
                                            color: bgColor,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ListTile(
                                                  isThreeLine: true,
                                                  title: Text(orderController
                                                      .orders[index].cusname),
                                                  subtitle: Text(
                                                      'Ordered On : $formattedDate',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                  trailing: DropdownButton(
                                                    onChanged: (value) {
                                                      userController
                                                          .upadateUser(
                                                              orderController
                                                                      .orders[
                                                                  index],
                                                              value);
                                                      // setState(() => orderController
                                                      //     .orders[index].status = value);
                                                    },
                                                    value: orderController
                                                        .orders[index].status,
                                                    items: status
                                                        .map(
                                                          (e) =>
                                                              DropdownMenuItem(
                                                            value: e,
                                                            child: Text(e),
                                                          ),
                                                        )
                                                        .toList(),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0,
                                                          right: 8.0,
                                                          bottom: 8.0),
                                                  child: Text(
                                                      '${orderController.orders[index].item.map((e) => '${e.pname} x ${e.quantity} ${e.variationtype}').toString().replaceAll('(', '').replaceAll(')', '')}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0,
                                                          right: 8.0,
                                                          bottom: 8.0),
                                                  child: Text(
                                                    'Address : ${orderController.orders[index].address}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: secondaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Products with Less Stock',
                                        style:
                                            Theme.of(context).textTheme.title),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: productsController.products
                                          .where((products) =>
                                              products.quantity < 10)
                                          .toList()
                                          .length,
                                      itemBuilder: (context, index) {
                                        var data = productsController.products
                                            .where((products) =>
                                                products.quantity < 10)
                                            .toList()[index];
                                        TextEditingController qnt =
                                            TextEditingController(
                                                text: data.quantity.toString());
                                        return Card(
                                          color: bgColor,
                                          child: ListTile(
                                            title: Text(
                                              '${data.name} (${data.variationtype})',
                                              style: TextStyle(
                                                  color: data.quantity == 0
                                                      ? Colors.red
                                                      : Colors.yellow),
                                            ),
                                            trailing: SizedBox(
                                              width: 180,
                                              child: Row(
                                                children: [
                                                  Text('Quantity : '),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SizedBox(
                                                      width: 50,
                                                      child: TextField(
                                                        textAlignVertical:
                                                            TextAlignVertical
                                                                .center,
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: qnt,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.check),
                                                    onPressed: () =>
                                                        firebaseFirestore
                                                            .collection(
                                                                'products')
                                                            .doc(data.docid)
                                                            .update({
                                                      'quantity':
                                                          double.parse(qnt.text)
                                                    }),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            color: secondaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Products with Less Stock',
                                      style: Theme.of(context).textTheme.title),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: productsController.products
                                        .where((products) =>
                                            products.quantity < 10)
                                        .toList()
                                        .length,
                                    itemBuilder: (context, index) {
                                      var data = productsController.products
                                          .where((products) =>
                                              products.quantity < 10)
                                          .toList()[index];
                                      TextEditingController qnt =
                                          TextEditingController(
                                              text: data.quantity.toString());
                                      return Card(
                                        color: bgColor,
                                        child: ListTile(
                                          title: Text(
                                            '${data.name} (${data.variationtype})',
                                            style: TextStyle(
                                                color: data.quantity == 0
                                                    ? Colors.red
                                                    : Colors.yellow),
                                          ),
                                          trailing: SizedBox(
                                            width: 180,
                                            child: Row(
                                              children: [
                                                Text('Quantity : '),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    width: 50,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      textAlign:
                                                          TextAlign.center,
                                                      controller: qnt,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.check),
                                                  onPressed: () =>
                                                      firebaseFirestore
                                                          .collection(
                                                              'products')
                                                          .doc(data.docid)
                                                          .update({
                                                    'quantity':
                                                        int.parse(qnt.text)
                                                  }),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // height: 350,
                            child: Card(
                              color: secondaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Recent Orders',
                                        style:
                                            Theme.of(context).textTheme.title),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: orderController.orders
                                                  .where((v) =>
                                                      v.status ==
                                                      'Order Placed')
                                                  .toList()
                                                  .length >
                                              6
                                          ? 6
                                          : orderController.orders
                                              .where((v) =>
                                                  v.status == 'Order Placed')
                                              .toList()
                                              .length,
                                      itemBuilder: (context, index) {
                                        String formattedDate =
                                            DateFormat('EEE, d-M-y | hh:mm')
                                                .format(orderController
                                                    .orders[index].datetime
                                                    .toDate());
                                        return Card(
                                          color: bgColor,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                isThreeLine: true,
                                                title: Text(orderController
                                                    .orders[index].cusname),
                                                subtitle: Text(
                                                    'Ordered On : $formattedDate',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                trailing: DropdownButton(
                                                  onChanged: (value) {
                                                    userController.upadateUser(
                                                        orderController
                                                            .orders[index],
                                                        value);
                                                    // setState(() => orderController
                                                    //     .orders[index].status = value);
                                                  },
                                                  value: orderController
                                                      .orders[index].status,
                                                  items: status
                                                      .map(
                                                        (e) => DropdownMenuItem(
                                                          value: e,
                                                          child: Text(e),
                                                        ),
                                                      )
                                                      .toList(),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0,
                                                    right: 8.0,
                                                    bottom: 8.0),
                                                child: Text(
                                                    '${orderController.orders[index].item.map((e) => '${e.pname} x ${e.quantity} ${e.variationtype}').toString().replaceAll('(', '').replaceAll(')', '')}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0,
                                                    right: 8.0,
                                                    bottom: 8.0),
                                                child: Text(
                                                  'Address : ${orderController.orders[index].address}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
          ),
        ],
      ),
    ));
  }
}

class Responsivecard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: FileInfoCardGridView(),
      tablet: FileInfoCardGridView(),
      desktop: FileInfoCardGridView(),
    );
  }
}
