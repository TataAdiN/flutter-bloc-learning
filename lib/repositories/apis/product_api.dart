import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';
import 'exceptions/internal_server_exception.dart';

class ProductApi{

  Future<List<Product>> fetch() async {
    final fetchProductsRequest = Uri.parse('https://dummyjson.com/products');

    final fetchProductsResponse = await http.get(fetchProductsRequest);

    if (fetchProductsResponse.statusCode == 500) {
      throw InternalServerException();
    }

    final productsJson = jsonDecode(fetchProductsResponse.body)['products'];

    List<Product> products = [];
    for (var item in productsJson) {
      Product post = Product.fromJson(item);
      products.add(post);
    }
    return products;
  }
}