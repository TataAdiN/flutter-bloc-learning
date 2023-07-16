import 'package:bloc_learning/repositories/apis/post_api.dart';

import 'models/post.dart';

class PostRepository{
  PostApi postApi = PostApi();

  Future<List<Post>> fetchPosts() async {
    List<Post> posts = await postApi.fetch();
    return posts;
  }
}