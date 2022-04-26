import 'package:chownow/constants/colors.dart';
import 'package:chownow/constants/endpoints.dart';
import 'package:chownow/controller/get/foodlist.dart';
import 'package:chownow/model/foodmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodItems extends StatefulWidget {
  @override
  _FoodItemsState createState() => _FoodItemsState();
}

class _FoodItemsState extends State<FoodItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: Colors.white,
          //   automaticallyImplyLeading: true,
          //   iconTheme: IconThemeData(color: primarycolor),
          // ),
          appBar: AppBar(
            title: Text('Products List'),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FutureBuilder<FoodModel>(
                    future: FoodController.getFood(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        double cardWidth =
                            MediaQuery.of(context).size.width / 3.3;
                        double cardHeight =
                            MediaQuery.of(context).size.height / 2.2;
                        return snapshot.data!.data == null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(snapshot.data!.message!)),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio:
                                            MediaQuery.of(context).size.width >
                                                    700
                                                ? cardWidth / cardHeight
                                                : cardHeight / cardWidth * 0.4,
                                        crossAxisCount:
                                            MediaQuery.of(context).size.width >
                                                    700
                                                ? 3
                                                : 1),
                                itemCount: snapshot.data!.data!.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var data = snapshot.data!.data![index];
                                  var image = data.image!.replaceAll('\\', '/');
                                  return InkWell(
                                    onTap: () {
                                      // Get.to(
                                      //   () => FoddDetails(id: data.itemId, bcode:widget.bcode),
                                      // );
                                    },
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 50,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    1035
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.43
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.72,
                                            child: Card(
                                                elevation: 10.0,
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 50,
                                                      ),
                                                      Text(
                                                        data.name!,
                                                        style: TextStyle(
                                                          color: primarycolor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        data.description!,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color: primarycolor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '\$ ${data.finalPrice}',
                                                        style: TextStyle(
                                                          color: primarycolor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Item Status : ',
                                                            style: TextStyle(),
                                                          ),
                                                          SizedBox(
                                                            width: 120,
                                                            child:
                                                                DropdownButton(
                                                                    onChanged:
                                                                        (v) {
                                                                      FoodController.updatefoodstatus(
                                                                              status: v,
                                                                              itemId: data.itemId)
                                                                          .then(
                                                                        (value) =>
                                                                            setState(() {}),
                                                                      );
                                                                      // OrderController.updateorder(
                                                                      //         orderId: data.orderId,
                                                                      //         orderStatus: v)
                                                                      //     .then((v) => setState(() {}));
                                                                    },
                                                                    value: data
                                                                        .status,
                                                                    items: [
                                                                  DropdownMenuItem(
                                                                    child: Text(
                                                                        'Enable'),
                                                                    value: 1,
                                                                  ),
                                                                  DropdownMenuItem(
                                                                    child: Text(
                                                                        'Disable'),
                                                                    value: 0,
                                                                  ),
                                                                ]),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.07,
                                          child: Card(
                                            child: CircleAvatar(
                                              maxRadius: 50.0,
                                              backgroundImage: NetworkImage(
                                                  '${Connection.imageUrl}${data.image}'),
                                            ),
                                            elevation: 18.0,
                                            shape: CircleBorder(),
                                            clipBehavior: Clip.antiAlias,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                      }
                    })),
          )),
    );
  }
}
