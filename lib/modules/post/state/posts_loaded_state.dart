import '../../../repositories/models/post.dart';
import 'post_state.dart';

class PostLoadedState extends PostState{
  List<Post> posts = [];

  PostLoadedState({required this.posts});
}