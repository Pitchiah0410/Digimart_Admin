class OrderModel {
  static const ITEM = "item";
  static const TOTALPRICE = "totalprice";
  static const PHONE = "phone";
  static const ADDRESS = "address";
  static const CUSNAME = "cusName";
  static const PINCODE = "pincode";
  static const DATETIME = "datetime";
  static const STATUS = "deliverystatus";
  static const USERID = "userId";
  static const DOCID = "docId";

  double totalprice;
  String cusname;
  String address;
  String phone;
  String pincode;
  String userId;
  String docId;
  var datetime;
  String status;
  List<OrderItemModel> item;

  OrderModel(
      {this.address,
      this.status,
      this.item,
      this.cusname,
      this.userId,
      this.docId,
      this.totalprice,
      this.datetime,
      this.phone,
      this.pincode});

  OrderModel.fromMap(Map<String, dynamic> data) {
    phone = data[PHONE];
    address = data[ADDRESS];
    cusname = data[CUSNAME];
    docId = data[DOCID];
    pincode = data[PINCODE];
    datetime = data[DATETIME];
    totalprice = data[TOTALPRICE];
    status = data[STATUS];
    userId = data[USERID];
    item = _convertCartItems(data[ITEM]);
  }
}

List<OrderItemModel> _convertCartItems(List cartFomDb) {
  List<OrderItemModel> _result = [];
  if (cartFomDb.length > 0) {
    cartFomDb.forEach((element) {
      _result.add(OrderItemModel.fromMap(element));
    });
  }
  return _result;
}

//--------------------------------------------------------------------------------------------------

// Order Item Model

class OrderItemModel {
  static const ID = "orderId";
  static const IMAGE = "image";
  static const PNAME = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const PRODUCT_ID = "productId";
  static const VARIATIONTYPE = "variationtype";

  String id;
  String image;
  String quantity;
  String cost;
  String productId;
  String price;
  String variationtype;
  String pname;

  OrderItemModel({
    this.productId,
    this.id,
    this.image,
    this.pname,
    this.price,
    this.quantity,
    this.variationtype,
    this.cost,
  });

  OrderItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    pname = data[PNAME];
    quantity = data[QUANTITY];
    cost = data[COST];
    productId = data[PRODUCT_ID];
    price = data[PRICE];
    variationtype = data[VARIATIONTYPE];
  }

  Map<String, dynamic> toJson() => {
        ID: id,
        PRODUCT_ID: productId,
        IMAGE: image,
        PNAME: pname,
        QUANTITY: quantity,
        COST: price,
        PRICE: price,
      };
}

class OrderConfigModel {
  static const RANGE = 'range';
  static const MINFEE = 'minfee';
  static const MAXFEE = 'maxfee';
  String minfee;
  String maxfee;
  String range;
  OrderConfigModel({this.minfee, this.maxfee, this.range});
  OrderConfigModel.fromMap(data) {
    minfee = data[MINFEE];
    maxfee = data[MAXFEE];
    range = data[RANGE];
  }
}
