import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picky_pics_bloc/Authentication/auth_login.dart';
import 'package:picky_pics_bloc/Authentication/auth_repository.dart';
import 'package:picky_pics_bloc/Authentication/form_submission_status.dart';
import 'package:picky_pics_bloc/Authentication/login_state.dart';

class login_bloc extends Bloc<LoginEvent, LoginState> {
  var auth = AuthRepository();
  login_bloc({required this.auth})
      : super(LoginState(emailid: 'emaild', password: 'password'));
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginuseremailidChanged) {
      yield state.copyWith(emailid: event.emailid);
    } else if (event is LoginpasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      try {
        await auth.login(emailid:state.emailid,password:state.password);
        yield state.copyWith(
          formStatus: SubmissionSuccess(),
        );
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFail(e.toString()));
      }
    }
  }
}
