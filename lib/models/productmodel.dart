class ProductModel {
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
