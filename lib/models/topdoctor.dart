import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String name;
  final String specialty;
  final String rating;
  final String distance;
  final String image;
  final String about;

  Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.distance,
    required this.image,
    required this.about,
  });

  factory Doctor.fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return Doctor(
      name: map['name'] ?? '',
      specialty: map['specialty'] ?? '',
      rating: map['rating']?.toString() ?? '',
      distance: map['distance'] ?? '',
      image: map['image'] ?? '',
      about: map['about'] ?? '',
    );
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      name: map['name'] ?? '',
      specialty: map['specialty'] ?? '',
      rating: map['rating'] ?? '',
      distance: map['distance'] ?? '',
      image: map['image'] ?? '',
      about: map['about'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialty': specialty,
      'rating': rating,
      'distance': distance,
      'image': image,
      'about': about,
    };
  }
}
