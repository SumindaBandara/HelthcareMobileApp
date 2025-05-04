class Doctor {
  final String name;
  final String specialty;
  final String rating;
  final String distance;
  final String image;

  Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.distance,
    required this.image,
  });

  // Factory method to create a Doctor from a map (e.g., from database or API)
  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      name: map['name'] ?? '',
      specialty: map['specialty'] ?? '',
      rating: map['rating'] ?? '',
      distance: map['distance'] ?? '',
      image: map['image'] ?? '',
    );
  }

  // Optionally: convert to map for saving back to database
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialty': specialty,
      'rating': rating,
      'distance': distance,
      'image': image,
    };
  }

  // Static method for dummy data (optional - similar to Todo.toDoList())
  static List<Doctor> topDoctorsList() {
    return [
      Doctor(
        name: "Dr. Rishi",
        specialty: "Cardiologist",
        rating: "4.7",
        distance: "800m away",
        image: "assets/doctor1.jpg",
      ),
      Doctor(
        name: "Dr. Vaamana",
        specialty: "Dentist",
        rating: "4.7",
        distance: "800m away",
        image: "assets/doctor2.jpg",
      ),
      Doctor(
        name: "Dr. Nallarasi",
        specialty: "Orthopaedic",
        rating: "4.7",
        distance: "800m away",
        image: "assets/doctor3.jpg",
      ),
      Doctor(
        name: "Dr. Nihal",
        specialty: "Cardiologist",
        rating: "4.7",
        distance: "800m away",
        image: "assets/doctor4.jpg",
      ),
      Doctor(
        name: "Dr. Rishita",
        specialty: "Cardiologist",
        rating: "4.7",
        distance: "800m away",
        image: "assets/doctor5.jpg",
      ),
    ];
  }
}
