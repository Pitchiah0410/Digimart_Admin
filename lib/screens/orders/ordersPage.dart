import 'package:digimartadmin/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      double maxscrollextent = _scrollController.position.maxScrollExtent;
      double currentscroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;
      if (maxscrollextent - currentscroll <= delta) {
        // orderController.getmoreOrders();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        // height: 350,
        child: Card(
          color: secondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Orders History',
                    style: Theme.of(context).textTheme.title),
                orderController.orders.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: orderController.orders.length,
                        itemBuilder: (context, index) {
                          String formattedDate =
                              DateFormat('EEE, d-M-y | hh:mm').format(
                                  orderController.orders[index].datetime
                                      .toDate());
                          return Card(
                              color: bgColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                        orderController.orders[index].cusname),
                                    subtitle: Text(formattedDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline),
                                    trailing: Text(
                                        'Order Total : ₹${orderController.orders[index].totalprice}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 8.0, bottom: 8.0),
                                    child: Text(
                                        '${orderController.orders[index].item.map((e) => '${e.pname} x ${e.quantity} ${e.variationtype}').toString().replaceAll('(', '').replaceAll(')', '')}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 8.0, bottom: 8.0),
                                    child: Text(
                                      'Address : ${orderController.orders[index].address}',
                                      style:
                                          Theme.of(context).textTheme.overline,
                                    ),
                                  )
                                ],
                              ));
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
