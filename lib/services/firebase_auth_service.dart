import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/model/user_model.dart';
import 'package:untitled/services/firebase_data_services.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerAccount(
    String email,
    String password,
    UserModel userData,
  ) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user?.uid != null) {
        userData.uid = user.user?.uid;
        FirebaseDataService().saveUserData(userData);
      }
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future loginAccount(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user != null) {
        return "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        return "Please check your password";
      } else {
        return "User Not Found";
      }
    }
  }
}
