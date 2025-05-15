class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final String distance;
  final String imageUrl;
  final List<String> availableSlots; // New field

  Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.distance,
    required this.imageUrl,
    this.availableSlots = const [], // Initialize with empty list
  });
}
