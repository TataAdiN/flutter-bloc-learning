import 'auth_event.dart';

class AuthLoginEvent implements AuthEvent {

  AuthLoginEvent({required username, required password}){
    _username = username;
    _password = password;
  }

  String _username = '';
  String _password = '';

  Future<bool> login() async {
    return await Future.delayed(const Duration(seconds: 3), (){
      if((_username == 'tata') && (_password == '123123123')){
        return true;
      }else{
        return false;
      }
    });
  }
}