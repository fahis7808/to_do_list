import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/model/user_model.dart';
import '../services/firebase_data_services.dart';

class AuthenticationProvider extends ChangeNotifier {
  String email = "";
  String password = "";
  bool showPassword = true;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners(); }



  UserModel userModel = UserModel();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  User? _user;

  AuthenticationProvider() {
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;

  Future login() async {
    if (email != "" && password != "") {
      try {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return "success";
      } on FirebaseAuthException catch (e) {
        if (e.code == "wrong-password") {
          return "Incorrect password.";
        } else if (e.code == "user-not-found") {
          return "No user found with this email.";
        } else if (e.code == "invalid-email") {
          return "Invalid email address.";
        } else if (e.code == "invalid-credential") {
          return "Invalid email address or password";
        } else {
          return e.message ?? "Login failed.";
        }
      }
    } else {
      return "Email and Password Can't be Empty";
    }
  }

  Future createAccount() async {
    if (userModel.email != null && password != "") {
      try {
        notifyListeners();
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: userModel.email.toString(),
          password: password,
        );
        if (credential.user != null) {
          userModel.uid = credential.user!.uid;
          await FirebaseDataService().saveUserData(userModel);
        }
        return "success";
      } on FirebaseAuthException catch (e) {
        return e.message ?? "Registration failed.";
      }
    } else {
      return "Email and Password Can't be Empty";
    }
  }

  Future logOut() async{
    await _auth.signOut();
  }

  onRefresh(){
    notifyListeners();
  }
}
