import '../../../repositories/apis/exceptions/internal_server_exception.dart';
import '../../../repositories/models/post.dart';
import '../../../repositories/post_repository.dart';
import 'post_event.dart';

class FetchPostEvent implements PostEvent{

  Future<List<Post>> fetch() async {
    final PostRepository apiRepository = PostRepository();
    try {
      return await apiRepository.fetchPosts();
    } on InternalServerException {
      throw Future.error(InternalServerException);
    }
  }
}