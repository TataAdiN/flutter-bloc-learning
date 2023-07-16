import 'post_state.dart';

class PostErrorState extends PostState{

  PostErrorState(String message){
    this.message = '{$message}, please try again later....';
  }
}