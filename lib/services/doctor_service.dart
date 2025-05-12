import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/topdoctor.dart';

class DoctorService {
  final FirebaseFirestore _firestore;

  DoctorService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<Doctor>> fetchDoctors() async {
    try {
      final snapshot = await _firestore.collection('topdoctor').get();

      print('Loaded ${snapshot.docs.length} doctors');

      return snapshot.docs.map((doc) {
        try {
          return Doctor.fromFirestore(doc);
        } catch (e) {
          print('Error parsing doctor document: $e');
          throw Exception('Invalid doctor data');
        }
      }).toList();
    } catch (e) {
      print('Error fetching doctors from Firestore: $e');
      rethrow;
    }
  }
}
