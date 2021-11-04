import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
<<<<<<< HEAD
  static const BRAND = 'brand';
=======
<<<<<<< HEAD
  ProductModel({
    this.onsale,
    this.photoUrl,
    this.featured,
    this.productId,
    this.price,
    this.pincode,
    this.quantity,
    this.description,
    this.category,
    this.name,
  });

  bool onsale;
  List<String> photoUrl;
  bool featured;
  String productId;
  List<Price> price;
  List<String> pincode;
  double quantity;
  String description;
  String category;
  String name;
  String docid;

  ProductModel.fromMap(Map<String, dynamic> json, String documentid) {
    docid = documentid;
    onsale = json["onsale"];
    photoUrl = List<String>.from(json["photo_url"].map((x) => x));
    featured = json["featured"];
    productId = json["product_id"];
    price = List<Price>.from(json["price"].map((x) => Price.fromMap(x)));
    pincode = List<String>.from(json["pincode"].map((x) => x));
    quantity = json["quantity"];
    description = json["description"];
    category = json["category"];
    name = json["name"];
  }
}

class Price {
  Price({
    this.mrp,
    this.offerprice,
    this.variation,
  });

  String mrp;
  String offerprice;
  String variation;

  Price.fromMap(Map<String, dynamic> json) {
    mrp = json["mrp"] ?? '85';
    offerprice = json["offerprice"] ?? '75';
    variation = json["variation"] ?? "1Kg";
  }
}

=======
  static const VARIATIONTYPE = "variationtype";
  static const NAME = "name";
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
  static const CATEGORY = "category";
  static const FEATURED = "isRecommended";
  static const QUANTITY = "maxquantity";
  static const NAME = "name";
  static const PHOTO = "photo_url";
<<<<<<< HEAD
  static const MRP = 'mrp';
  static const OFFERPRICE = 'price';
  static const PRODUCTID = "id";
  static const ONSALE = "onsale";
  static const DESCRIPTION = "description";
  static const VARIENT = "varients";
  static const VARIATION = "variation";
  static const TYPE = 'type';

  String brand;
  String variation;
=======
  // static const PRICE = "price";
  static const QUANTITY = "quantity";
  static const VARIATION = "variation";
  static const ONSALE = "onsale";
  static const DESCRIPTION = "description";
  // static const REVIEWS = "reviews";
  static const FEATURED = "featured";
  static const PRODUCTID = "product_id";
  static const RATINGS = "rating";
  static const PINCODE = "pincode";
  static const OFFERPRICE = "discount";
  static const TAX = "tax";
  static const SHIPPINGPRICE = "shippingfee";
  // List<Product> productList = [];
  String variationtype;
  String name;
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
  String category;
  bool featured;
  String type;
  var quantity;
  String name;
  List photo;
<<<<<<< HEAD
  var mrp;
  String productid;
  var offerprice;
  bool onsale;
  String description;
  List<Varient> varient;

  DocumentSnapshot doc;
  String docid;
  ProductModel({
    this.name,
    this.type,
    this.category,
    this.description,
    this.doc,
    this.brand,
    this.featured,
    this.onsale,
    this.variation,
    this.photo,
    this.productid,
    this.quantity,
    this.docid,
  });

  ProductModel.fromMap(
      Map<String, dynamic> data, documentid, DocumentSnapshot docval) {
=======
  // String price;
  double quantity;
  List variation;
  bool onsale;
  String description;
  bool featured;
  String productid;
  String offerprice;
  List pincode;
  String rating;
  String docid;
  String tax;
  String shippingprice;
  ProductModel(
      {this.name,
      this.offerprice,
      this.category,
      this.description,
      this.featured,
      this.onsale,
      this.photo,
      // this.price,
      this.productid,
      this.quantity,
      this.rating,
      this.variationtype,
      this.pincode,
      // this.reviews,
      this.variation,
      this.docid,
      this.shippingprice,
      this.tax});

  ProductModel.fromMap(Map<String, dynamic> data, String documentid) {
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
    name = data[NAME];
    category = data[CATEGORY];
    brand = data[BRAND];
    type = data[TYPE];
    doc = docval;
    description = data[DESCRIPTION];
    featured = data[FEATURED];
    onsale = data[ONSALE];
    photo = data[PHOTO];
<<<<<<< HEAD
=======
    // price = data[PRICE];
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
    productid = data[PRODUCTID];
    mrp = data[MRP];
    offerprice = data[OFFERPRICE];
    quantity = data[QUANTITY];
<<<<<<< HEAD
    variation = data[VARIATION];
    docid = documentid;
    varient = _convertVarientItems(data[VARIENT]);
  }

  List<Varient> _convertVarientItems(List priceFomDb) {
    List<Varient> _result = [];
    if (priceFomDb.length > 0) {
      priceFomDb.forEach((element) {
        _result.add(Varient.fromMap(element));
      });
    }
    return _result;
  }
}

class VarientionModel {
static const NAME = "name";
static const PHOTO = "photo_url";
static const MRP = 'mrp';
static const OFFERPRICE = 'price';
static const PRODUCTID = "id";
static const VARIENT = "varients";
static const VARIATION = "variation";
static const QUANTITY = "maxquantity";
  var quantity;
  var offerprice;
  String name;
  List photo;
  var mrp;
  String productid;
  String variation;
  List<Varient> varient;
  VarientionModel(
      {this.productid,
      this.variation,
      this.mrp,
      this.name,
      this.photo,
      this.quantity,
      this.varient,
      this.offerprice});

  // VarientionModel.fromMap(Map<String, dynamic> data) {
  //   id = data[ID] ?? '';
  //   variation = data[VARIATION] ?? '';
  // }
}

class Varient {
  static const ID = 'id';
  static const VARIATION = 'vari';
  String id;
  String variation;
  Varient({this.id, this.variation});

  Varient.fromMap(Map<String, dynamic> data) {
    id = data[ID] ?? '';
    variation = data[VARIATION] ?? '';
  }
}

=======
    rating = data[RATINGS];
    variationtype = data[VARIATIONTYPE];
    // reviews = data[REVIEWS];
    variation = data[VARIATION];
    pincode = data[PINCODE];
    docid = documentid;
    offerprice = data[OFFERPRICE];
    shippingprice = data[SHIPPINGPRICE];
    tax = data[TAX];
  }
}

>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
class CategoryModel {
  static const IMAGE = "photo_url";
  static const TITLE = "title";
  String image;
  String title;
  String docid;
  CategoryModel({this.image, this.title, this.docid});
  CategoryModel.fromMap(Map<String, dynamic> data, documentid) {
    image = data[IMAGE];
    title = data[TITLE];
    docid = documentid;
  }
}
