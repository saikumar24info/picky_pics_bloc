import 'package:flutter/cupertino.dart';

class AuthRepository {
  Future<void> login(String emailid,String password) async {
    print("attemptinig to login");
    Future.delayed(Duration(seconds: 2));
    print("logged in");
    throw Exception("somethinig went wrong");
  }
}
