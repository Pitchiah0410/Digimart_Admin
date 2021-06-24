import 'package:auto_size_text/auto_size_text.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class FileInfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  FileInfoCardGridView({
    Key key,
    this.crossAxisCount,
    this.childAspectRatio,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Obx(
      () => GridView.count(
        shrinkWrap: true,
        crossAxisCount: _size.width < 650 ? 2 : 4,
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Card(
            color: secondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText('Total Product',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    AutoSizeText(productsController.products.length.toString(),
                        maxLines: 1,
                        style: TextStyle(fontSize: 20.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: secondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText('Total Earnings',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    AutoSizeText(
                        orderController.orders
                            .fold(
                                0,
                                (previousValue, element) =>
                                    previousValue + element.totalprice)
                            .toString(),
                        maxLines: 1,
                        style: TextStyle(fontSize: 20.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: secondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText('Total Oders',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    AutoSizeText(orderController.orders?.length.toString(),
                        maxLines: 1,
                        style: TextStyle(fontSize: 20.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: secondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText('Total Users',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    AutoSizeText(userController.users.length.toString(),
                        maxLines: 1,
                        style: TextStyle(fontSize: 20.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
