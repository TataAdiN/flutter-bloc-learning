import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/apis/exceptions/internal_server_exception.dart';
import '../../../repositories/models/post.dart';
import '../event/fetch_post_event.dart';
import '../event/post_event.dart';
import '../state/post_error_state.dart';
import '../state/post_loading_state.dart';
import '../state/post_state.dart';
import '../state/posts_loaded_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoadingState()) {
    on<FetchPostEvent>(_fetchPost);
  }

  _fetchPost(
    FetchPostEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      List<Post> posts = await event.fetch();
      emit(PostLoadedState(posts: posts));
    } on InternalServerException catch (exception) {
      emit(PostErrorState(exception.message));
    }
  }
}
