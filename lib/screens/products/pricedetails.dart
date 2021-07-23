import 'dart:html';
import 'package:firebase/firebase.dart' as fb;
import 'package:digimartadmin/constants.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceDetails extends StatefulWidget {
  @override
  _PriceDetailsState createState() => _PriceDetailsState();
}

class _PriceDetailsState extends State<PriceDetails> {
  var variationTECs = <TextEditingController>[];
  var priceTECs = <TextEditingController>[];
  var offerpriceTECs = <TextEditingController>[];
  var cards = <Card>[];

  Card createCard() {
    var variationController = TextEditingController();
    var priceController = TextEditingController();
    var offerpriceController = TextEditingController();

    variationTECs.add(variationController);
    priceTECs.add(priceController);
    offerpriceTECs.add(offerpriceController);
    void uploadImage({@required Function(File file) onSelected}) {
      InputElement uploadInput = FileUploadInputElement();
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        final file = uploadInput.files.first;
        final reader = FileReader();
        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((event) {
          onSelected(file);
          showDialog(
              context: Get.context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularProgressIndicator(),
                        Text('Loading...')
                      ]),
                );
              });
        });
      });
    }

    void uploadToStorage({fileName, state}) {
      final path = 'products/$fileName';
      uploadImage(onSelected: (file) {
        fb
            .storage()
            .refFromURL('gs://freshwheels-969bf.appspot.com/')
            .child(path)
            .put(file)
            .future
            .then((data) async {
          Uri uri = await data.ref.getDownloadURL();
          state(() {
            variationController.text = uri.toString();
          });
          Navigator.pop(Get.context);
        });
      });
    }

    return Card(
      child: StatefulBuilder(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 600,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Person ${cards.length + 1}'),
                      TextField(
                          controller: variationController,
                          decoration: InputDecoration(labelText: 'Variation')),
                      TextField(
                          controller: priceController,
                          decoration: InputDecoration(labelText: 'MRP')),
                      TextField(
                          controller: offerpriceController,
                          decoration:
                              InputDecoration(labelText: 'Offer Price')),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Or'),
              ),
              Column(
                children: [
                  variationController.text.isEmpty
                      ? Container()
                      : Image.network(
                          variationController.text,
                          height: 150,
                          width: 70,
                        ),
                  Card(
                      color: secondaryColor,
                      child: Center(
                        child: TextButton.icon(
                            onPressed: () => uploadToStorage(
                                state: state,
                                fileName:
                                    DateTime.now().millisecondsSinceEpoch),
                            icon: Icon(
                              Icons.upload_file,
                            ),
                            label: Text('Upload Image')),
                      )),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    for (int i = 0; i < cards.length; i++) {
      var variation = variationTECs[i].text;
      var price = priceTECs[i].text;
      var offerprice = offerpriceTECs[i].text;
      productsController.price.add(PriceData(variation, price, offerprice));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text('Submit'),
              onPressed: _onDone,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() => cards.add(createCard())),
      ),
    );
  }
}

class PriceData {
  final String variation;
  final String price;
  final String offerprice;

  PriceData(this.variation, this.price, this.offerprice);
}
