import 'package:digimartadmin/constants.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:flutter/material.dart';
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
    return Card(
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
              decoration: InputDecoration(labelText: 'Offer Price')),
        ],
      ),
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
              child: Text('Add new'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          )
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}


class PriceData {
  final String variation;
  final String price;
  final String offerprice;

  PriceData(this.variation, this.price, this.offerprice);
}