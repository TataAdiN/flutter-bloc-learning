import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';
import 'exceptions/internal_server_exception.dart';

class PostApi{

  Future<List<Product>> fetch() async {
    final fetchPostsRequest = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final fetchPostsResponse = await http.get(fetchPostsRequest);

    if (fetchPostsResponse.statusCode == 500) {
      throw InternalServerException();
    }

    final postsJson = jsonDecode(fetchPostsResponse.body);

    List<Product> posts = [];
    for (var item in postsJson) {
      Product post = Product.fromJson(item);
      posts.add(post);
    }
    return posts;
  }
}