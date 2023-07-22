import 'auth_state.dart';

class AuthLoadingState extends AuthState{

  AuthLoadingState(){
    message = 'Please wait, while authentication....';
  }
}