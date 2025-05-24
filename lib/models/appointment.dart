class Appointment {
  final String doctorName;
  final String specialty;
  final String patientName;
  final int age;
  final String phone;
  final String paymentMethod;
  final DateTime createdAt;

  Appointment({
    required this.doctorName,
    required this.specialty,
    required this.patientName,
    required this.age,
    required this.phone,
    required this.paymentMethod,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'doctorName': doctorName,
      'specialty': specialty,
      'patientName': patientName,
      'age': age,
      'phone': phone,
      'paymentMethod': paymentMethod,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
