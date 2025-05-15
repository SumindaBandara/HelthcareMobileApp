import 'package:flutter/material.dart';
import 'Doctor.dart';
import 'DoctorCard.dart'; // Make sure this path is correct

class FindDoctorScreen extends StatefulWidget {
  const FindDoctorScreen({super.key});

  @override
  State<FindDoctorScreen> createState() => _FindDoctorScreenState();
}

class _FindDoctorScreenState extends State<FindDoctorScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Doctor> _doctors = [];
  bool _isSearching = false;

  // Sample doctors list - in a real app, this would come from an API
  final List<Doctor> _allDoctors = [
    Doctor(
      name: 'Dr. Sashika Ranasinghe',
      specialty: 'Neurologist',
      rating: 4.9,
      distance: '2.9 Km',
      imageUrl: 'images/doctor1.jpg',
    ),
    Doctor(
      name: 'Dr. Kevin Perera',
      specialty: 'Dermatologist',
      rating: 4.7,
      distance: '1.8km away',
      imageUrl: 'images/doctor2.webp',
    ),
    Doctor(
      name: 'Dr. Nuwan Jayasuriya',
      specialty: 'Orthopedic Surgeon',
      rating: 4.6,
      distance: '4.0km away',
      imageUrl: 'images/doctor3.avif',
    ),
    Doctor(
      name: 'Dr. Ayesh Jayashan',
      specialty: 'physical Theropyst',
      rating: 4.7,
      distance: '3.5km away',
      imageUrl: 'images/doctor4.png',
    ),
    Doctor(
      name: 'Mrs. Jayasooriya',
      specialty: 'Neurology',
      rating: 4.5,
      distance: '4.0km away',
      imageUrl: 'images/doctor5.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _isSearching = query.isNotEmpty;
      if (_isSearching) {
        _doctors = _allDoctors.where((Doctor doctor) {
          // Explicitly type as Doctor
          return doctor.name.toLowerCase().contains(query) ||
              doctor.specialty.toLowerCase().contains(query);
        }).toList();
      } else {
        _doctors = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button and title
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Find Doctor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search doctor, drugs, articles...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/seventeen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[50],
                  foregroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Check Symptoms with AI'),
              ),
            ),

            // Doctor listing
            Expanded(
              child: _isSearching && _doctors.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: _doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = _doctors[index];
                        return DoctorCard(doctor: doctor);
                      },
                    )
                  : _isSearching && _doctors.isEmpty
                      ? Center(
                          child: Text(
                            'No doctors found',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
