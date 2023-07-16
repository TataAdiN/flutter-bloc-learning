import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';
import 'exceptions/internal_server_exception.dart';

class PostApi{

  Future<List<Post>> fetch() async {
    final fetchPostsRequest = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final fetchPostsResponse = await http.get(fetchPostsRequest);

    if (fetchPostsResponse.statusCode == 500) {
      throw InternalServerException();
    }

    final postsJson = jsonDecode(fetchPostsResponse.body);

    List<Post> posts = [];
    for (var item in postsJson) {
      Post post = Post.fromJson(item);
      posts.add(post);
    }
    return posts;
  }
}