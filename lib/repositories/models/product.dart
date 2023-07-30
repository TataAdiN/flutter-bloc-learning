class Product {
  int id, price, stock;
  double discountPercentage, rating;
  String title, description, brand, category, thumbnail;
  List<dynamic> images;
  Product(
      {
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.stock,
      required this.discountPercentage,
      required this.rating,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title: json['title'],
      description : json['description'],
      price : json['price'],
      stock : json['stock'],
      discountPercentage : json['discountPercentage'],
      rating : json['rating'] is double ? json['rating'] : json['rating'].roundToDouble(),
      brand : json['brand'],
      category : json['category'],
      thumbnail : json['thumbnail'],
      images : json['images']
  );

  Product copyWith({
    required int id,
    required String title,
    required String description,
    required int price,
    required int stock,
    required double discountPercentage,
    required double rating,
    required String brand,
    required String category,
    required String thumbnail,
    required List<String> images
  }) {
    return Product(
        id : id,
        title : title,
        description : description,
        price : price,
        stock : stock,
        discountPercentage : discountPercentage,
        rating : rating,
        brand : brand,
        category : category,
        thumbnail : thumbnail,
        images : images
    );
  }
}
