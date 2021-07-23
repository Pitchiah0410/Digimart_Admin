class ProductModel {
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
  static const CATEGORY = "category";
  static const PHOTO = "photo_url";
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
  String category;
  List photo;
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
    name = data[NAME];
    category = data[CATEGORY];
    description = data[DESCRIPTION];
    featured = data[FEATURED];
    onsale = data[ONSALE];
    photo = data[PHOTO];
    // price = data[PRICE];
    productid = data[PRODUCTID];
    quantity = data[QUANTITY];
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
