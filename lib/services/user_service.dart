import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> isValidUser(String email, String password) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking user: $e");
      return false;
    }
  }

  Future<void> addUser(String email, String password) async {
    try {
      await _firestore.collection('users').add({
        'email': email,
        'password': password,
      });
    } catch (e) {
      print("Error adding user: $e");
    }
  }
}
