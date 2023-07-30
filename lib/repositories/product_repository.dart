import 'apis/product_api.dart';
import 'models/product.dart';

class ProductRepository{
  final ProductApi _productApi = ProductApi();

  Future<List<Product>> fetchPosts() async {
    List<Product> posts = await _productApi.fetch();
    return posts;
  }
}