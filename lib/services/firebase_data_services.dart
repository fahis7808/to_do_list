import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/model/user_model.dart';

const String USER_COLLECTION_REF = "userData";

class FirebaseDataService {
  final CollectionReference _userRef = FirebaseFirestore.instance.collection(USER_COLLECTION_REF);

  Future<void> saveUserData(UserModel userData) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _userRef.doc(user.uid).set(userData.toMap());
    } else {
      throw FirebaseAuthException(
        code: 'NO_USER',
        message: 'No user is currently signed in.',
      );
    }
  }
}
