class ProductModel {
  static const VARIATIONTYPE = "variationtype";
  static const NAME = "name";
  static const CATEGORY = "category";
  static const PHOTO = "photo_url";
  static const PRICE = "price";
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
  String price;
  double quantity;
  List variation;
  bool onsale;
  String description;
  // List reviews;
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
      this.price,
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
    price = data[PRICE];
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
