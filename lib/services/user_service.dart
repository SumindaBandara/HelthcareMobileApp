import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Sign up a user with email and password and store user data in Firestore
  Future<String?> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
        name: name,
        email: email,
        password: password,
      );

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());

      return null; // success
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
      return e.message;
    } catch (e) {
      print('Unknown error: $e');
      return 'An unknown error occurred';
    }
  }
}
