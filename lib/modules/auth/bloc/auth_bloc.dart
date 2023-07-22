import 'package:flutter_bloc/flutter_bloc.dart';

import '../event/auth_event.dart';
import '../event/auth_login_event.dart';
import '../state/auth_fail.dart';
import '../state/auth_initial.dart';
import '../state/auth_loading.dart';
import '../state/auth_state.dart';
import '../state/auth_success.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthLoginEvent>(_authLogin);
  }

  _authLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    bool result = await event.login();
    if (result) {
      emit(AuthSuccessState());
    }else{
      emit(AuthFailState('Username or password is wrong'));
    }
  }
}
