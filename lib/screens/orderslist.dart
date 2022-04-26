import 'package:chownow/constants/colors.dart';
import 'package:chownow/controller/get/orderlist.dart';
import 'package:chownow/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Your Orders',
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(isScrollable: true, tabs: [
              Tab(
                text: 'New Orders',
              ),
              Tab(
                text: 'Accepted Orders',
              )
            ]),
          ),
          body: TabBarView(
            children: [
              PlacedOrders(
                status: 'PLACED',
              ),
              AcceptedOrders()
            ],
          ),
        ),
      ),
    );
  }

  // var payment = ["PENDING", "PAID", "ERROR"];

  // var delivery = ["PICKUP","DELIVERY","DINEIN","CURBSIDE"];
}

class AcceptedOrders extends StatefulWidget {
  const AcceptedOrders({Key? key}) : super(key: key);

  @override
  _AcceptedOrdersState createState() => _AcceptedOrdersState();
}

class _AcceptedOrdersState extends State<AcceptedOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Status'),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'ACCEPTED',
            ),
            Tab(
              text: 'PREPARING',
            ),
            Tab(
              text: 'INPROCESS',
            ),
            Tab(
              text: 'PREPARED',
            ),
            Tab(
              text: 'DELIVERED',
            )
          ]),
        ),
        body: TabBarView(children: [
          PlacedOrders(
            status: 'ACCEPTED',
          ),
          PlacedOrders(
            status: 'PREPARING',
          ),
          PlacedOrders(
            status: 'INPROCESS',
          ),
          PlacedOrders(
            status: 'PREPARED',
          ),
          PlacedOrders(
            status: 'DELIVERED',
          ),
        ]),
      ),
    );
  }
}

class PlacedOrders extends StatefulWidget {
  final status;
  PlacedOrders({required this.status});

  @override
  _PlacedOrdersState createState() => _PlacedOrdersState();
}

class _PlacedOrdersState extends State<PlacedOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<OrdersListModel>(
          future: OrderController.getorderlist(orderstatus: widget.status),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final DateFormat format = DateFormat('dd-MM-yyyy EEE');
              double cardWidth = MediaQuery.of(context).size.width / 3.3;
              double cardHeight = MediaQuery.of(context).size.height / 2.0;
              return snapshot.data!.data == null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(snapshot.data!.message!)),
                    )
                  : GridView.builder(
                      itemCount: snapshot.data!.data!.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio:
                              MediaQuery.of(context).size.width > 700
                                  ? cardWidth / cardHeight
                                  : cardHeight / cardWidth * 0.3,
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 700 ? 3 : 1),
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.data![index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.contactPersonName!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: primarycolor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data.contactPersonNumber.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: primarycolor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Items : ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: data.itemsList!
                                              .map((e) => e.name)
                                              .toList()
                                              .toString()
                                              .replaceAll('[', '')
                                              .replaceAll(']', ''),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primarycolor))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Ordered On : ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: format.format(data.createdOn!),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: primarycolor),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Sub Total : ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: data.subTotal.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primarycolor))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Discount : ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: data.discountAmount.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primarycolor))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Tax Amount : ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '${data.taxAmount} %',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primarycolor))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Grand Total : ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: data.grandTotal.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primarycolor))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Payment Status : ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: data.paymentStatus,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primarycolor))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Delivery Type : ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: data.deliveryType,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primarycolor))
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Order Status : ',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 160,
                                      child: DropdownButton(
                                          onChanged: (v) {
                                            OrderController.updateorder(
                                                    orderId: data.orderId,
                                                    orderStatus: v)
                                                .then((v) => setState(() {}));
                                          },
                                          value: data.orderStatus,
                                          items: widget.status == 'PLACED'
                                              ? order
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      child: Text(e),
                                                      value: e,
                                                    ),
                                                  )
                                                  .toList()
                                              : order2
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      child: Text(e),
                                                      value: e,
                                                    ),
                                                  )
                                                  .toList()),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
            }
          }),
    );
  }

  var order = [
    "PLACED",
    // "PREPARING",
    // "INPROCESS",
    // "PREPARED",
    // "DELIVERED",
    "CANCELLED",
    "ACCEPTED"
  ];
  var order2 = [
    "ACCEPTED",
    "PREPARING",
    "INPROCESS",
    "PREPARED",
    "DELIVERED",
  ];
}
