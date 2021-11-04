import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const BRAND = 'brand';
  static const CATEGORY = "category";
  static const FEATURED = "isRecommended";
  static const QUANTITY = "maxquantity";
  static const NAME = "name";
  static const PHOTO = "photo_url";
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
  String category;
  bool featured;
  String type;
  var quantity;
  String name;
  List photo;
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
    name = data[NAME];
    category = data[CATEGORY];
    brand = data[BRAND];
    type = data[TYPE];
    doc = docval;
    description = data[DESCRIPTION];
    featured = data[FEATURED];
    onsale = data[ONSALE];
    photo = data[PHOTO];
    productid = data[PRODUCTID];
    mrp = data[MRP];
    offerprice = data[OFFERPRICE];
    quantity = data[QUANTITY];
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
