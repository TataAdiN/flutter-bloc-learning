import 'auth_state.dart';

class AuthFailState extends AuthState{

  AuthFailState(String message){
    this.message = 'Oops.. $message';
  }
}