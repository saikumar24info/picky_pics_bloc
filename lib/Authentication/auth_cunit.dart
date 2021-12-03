import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState{login,signup,confirmSignUp}
class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(AuthState.login);
   void showlogin()=>emit(AuthState.login);
   void showSignUp=>emit(AuthState.signUp);
   void showConfirmSignUp({
     String username,
     String email,
      
   })
} 