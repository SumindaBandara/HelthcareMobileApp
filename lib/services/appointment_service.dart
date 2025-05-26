import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/appointment.dart';

class AppointmentService {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> addAppointment(Appointment appointment) async {
    try {
      await _firestore.collection('appointments').add(appointment.toMap());
      print("✅ Appointment added to Firestore");
    } catch (e) {
      print("❌ Failed to add appointment: $e");
    }
  }

  static Future<void> deleteAppointment(String docId) async {
    try {
      await _firestore.collection('appointments').doc(docId).delete();
      print("🗑️ Appointment deleted from Firestore");
    } catch (e) {
      print("❌ Failed to delete appointment: $e");
    }
  }
}
