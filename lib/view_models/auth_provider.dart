import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/model/user_model.dart';
import 'package:untitled/services/firebase_auth_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  String email = "";
  String password = "";

  UserModel userModel = UserModel();

  final FirebaseAuth _fireAuth = FirebaseAuth.instance;

  User? get currentUser => _fireAuth.currentUser;

  Future login() async {
    if (email != "" && password != "") {
      var response = await FirebaseAuthService().loginAccount(email, password);
      return response;
    } else {
      return "Email and Password Can't be Empty";
    }
  }

  Future createAccount() async {
    var response = await FirebaseAuthService().registerAccount(
      userModel.email.toString(),
      password,
      userModel,
    );
    return response;
  }
}
