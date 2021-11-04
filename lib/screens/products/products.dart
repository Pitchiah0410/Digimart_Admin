import 'dart:html';

import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:digimartadmin/models/productmodel.dart';
import 'package:digimartadmin/screens/products/pricedetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:firebase/firebase.dart' as fb;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:uuid/uuid.dart';
import '../../constants.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController minfee =
      TextEditingController(text: orderController.ordercongig.minfee);
  TextEditingController maxfee =
      TextEditingController(text: orderController.ordercongig.maxfee);
  TextEditingController range =
      TextEditingController(text: orderController.ordercongig.range);

  ScrollController horizontalcontroller = ScrollController();
  ScrollController verticalcontroller = ScrollController();
  List<ProductModel> usersFiltered = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    usersFiltered = productsController.products;
  }

  var rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      showTrackOnHover: true,
      controller: horizontalcontroller,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: horizontalcontroller,
        scrollDirection: Axis.horizontal,
        child: Scrollbar(
          showTrackOnHover: true,
          controller: verticalcontroller,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            controller: verticalcontroller,
            scrollDirection: Axis.vertical,
            child: Obx(
              () => productsController.products.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 300,
                                  child: Card(
                                    color: secondaryColor,
                                    child: new ListTile(
                                      leading: new Icon(Icons.search),
                                      title: new TextField(
                                          controller: controller,
                                          decoration: new InputDecoration(
                                              hintText: 'Search',
                                              border: InputBorder.none),
                                          onChanged: (value) {
                                            setState(() {
                                              usersFiltered = productsController
                                                  .products
                                                  .where((products) =>
                                                      products.name
                                                          .toLowerCase()
                                                          .contains(value
                                                              .toLowerCase()) ||
                                                      products.category
                                                          .contains(value
                                                              .toLowerCase()))
                                                  .toList();
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddProducts(
                                                  isedit: false,
                                                  onsale: true,
                                                  featured: false,
                                                  category: productsController
                                                      .categories.first.title,
                                                )));
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text('Add Item'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('MinFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: minfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'minfee': minfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('MaxFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: maxfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'maxfee': maxfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Range Value : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: range,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'range': range.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'No Products Available',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: Colors.white70),
                            ),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 300,
                                  child: Card(
                                    color: secondaryColor,
                                    child: new ListTile(
                                      leading: new Icon(Icons.search),
                                      title: new TextField(
                                          controller: controller,
                                          decoration: new InputDecoration(
                                              hintText: 'Search',
                                              border: InputBorder.none),
                                          onChanged: (value) {
                                            setState(() {
                                              usersFiltered = productsController
                                                  .products
                                                  .where((products) =>
                                                      products.name
                                                          .toLowerCase()
                                                          .contains(value
                                                              .toLowerCase()) ||
                                                      products.category
                                                          .contains(value
                                                              .toLowerCase()))
                                                  .toList();
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddProducts(
                                            isedit: false,
                                            onsale: false,
                                            featured: false,
                                            category: productsController
                                                .categories.first.title,
                                          ),
                                        ));
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text('Add Item'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('MinFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: minfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'minfee': minfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('MaxFee : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: maxfee,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'maxfee': maxfee.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Range Value : '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: range,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          firebaseFirestore
                                              .collection('settings')
                                              .doc('deliveryoptions')
                                              .update({
                                            'range': range.text
                                          }).whenComplete(() {
                                            FocusScope.of(context).unfocus();
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                          usersFiltered == null || usersFiltered.length == 0
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.81,
                                  child: PaginatedDataTable(
                                    showCheckboxColumn: false,
                                    source: DataTableSourceExpedition(
                                      context: context,
                                      onRowClicked: (index) {
                                        var element = usersFiltered[index];
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddProducts(
                                                nameval: element.name,
                                                brandnameval: element.brand,
                                                desval: element.description,
                                                stockval: element.quantity
                                                    ?.toString(),
                                                onsale: element.onsale,
                                                featured: element.featured,
                                                offerpriceval: element
                                                    .offerprice
                                                    ?.toString(),
                                                category: element.category,
                                                variationval: element.variation,
                                                isedit: true,
                                                mrpval: element.mrp?.toString(),
                                                type: element.type,
                                                docid: element.docid,
                                                image: element.photo),
                                          ),
                                        );
                                      },
                                      expeditions: usersFiltered,
                                    ),
                                    showFirstLastButtons: true,
                                    rowsPerPage: rowsPerPage,
                                    availableRowsPerPage: [1, 5, 10, 50],
                                    onRowsPerPageChanged: (newRowsPerPage) {
                                      if (newRowsPerPage != null) {
                                        setState(() {
                                          rowsPerPage = newRowsPerPage;
                                        });
                                      }
                                    },

                                    columns: [
                                      DataColumn(
                                        label: Text('SI.No'),
                                      ),
                                      DataColumn(
                                        label: Text('Delete'),
                                      ),
                                      DataColumn(
                                        label: Text('Image'),
                                      ),
                                      DataColumn(
                                        label: Text('Name'),
                                      ),
                                      DataColumn(
                                        label: Text('Brand'),
                                      ),
                                      DataColumn(
                                        label: Text('Product ID'),
                                      ),
                                      DataColumn(
                                        label: Text('On sale'),
                                      ),
                                      DataColumn(
                                        label: Text('MRP'),
                                      ),
                                      DataColumn(
                                        label: Text('Offer Price'),
                                      ),
                                      DataColumn(
                                        label: Text('Type'),
                                      ),
                                      DataColumn(
                                        label: Text('Available Stock'),
                                      ),
                                      DataColumn(
                                        label: Text('Category'),
                                      ),
                                      DataColumn(
                                        label: Text('Description'),
                                      ),
                                    ],
                                    // rows:
                                  ),
                                ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class DataTableSourceExpedition extends DataTableSource {
  List<ProductModel> expeditions = [];
  Function onRowClicked;
  Function onDeleteIconClick;
  BuildContext context;

  DataTableSourceExpedition(
      {this.expeditions,
      this.onRowClicked,
      this.onDeleteIconClick,
      this.context});
  DataRow getRow(int index) {
    final currentRowData = expeditions[index];

    return DataRow.byIndex(
        index: index,
        cells: <DataCell>[
          DataCell(
            Text('${index + 1}'),
          ),
          DataCell(
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Are you sure'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Do you want to delete ${currentRowData.name} ?',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                            title: "Loading...",
                                            content:
                                                CircularProgressIndicator(),
                                            barrierDismissible: false);
                                        firebaseFirestore
                                            .collection('products')
                                            .doc(currentRowData.docid)
                                            .delete()
                                            .then(
                                          (value) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                      child: Text('Delete'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )),
          ),
          DataCell(
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
                imageUrl: currentRowData.photo.first,
                placeholder: (context, url) =>
                    Image.asset('assets/icons/loading.gif'),
                height: 70,
                width: 45,
              ),
            ),
          ),
          DataCell(
            Text(currentRowData.name),
          ),
          DataCell(
            Text(currentRowData.brand),
          ),
          DataCell(
            Text(currentRowData.productid),
          ),
          DataCell(
            Text(
              currentRowData.onsale.toString(),
            ),
          ),
          DataCell(
            Text(
              currentRowData.mrp.toString(),
            ),
          ),
          DataCell(
            Text(
              currentRowData.offerprice.toString(),
            ),
          ),
          DataCell(
            Text(currentRowData.type),
          ),
          DataCell(
            Text(
              currentRowData.quantity.toString(),
            ),
          ),
          DataCell(
            Text(currentRowData.category),
          ),
          DataCell(
            SizedBox(
              width: 200,
              child: Text(
                currentRowData.description,
                style: TextStyle(fontSize: 12.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
        onSelectChanged: (b) => onRowClicked(index));
  }

  bool get isRowCountApproximate => false;

  int get rowCount => expeditions.length;

  int get selectedRowCount => 0;
}
