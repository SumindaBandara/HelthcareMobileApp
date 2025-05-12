import 'package:flutter/material.dart';
import 'package:untitled/models/topdoctor.dart';

import 'Services/doctor_service.dart';
import 'doctor_card.dart';

class TopDoctorsScreen extends StatelessWidget {
  TopDoctorsScreen({super.key});

  final DoctorService _doctorService = DoctorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/one');
          },
        ),
        title: const Text(
          "Top Doctors",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<Doctor>>(
        future: _doctorService.fetchDoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading doctors"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No doctors found"));
          }

          final doctors = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return DoctorCard(
                  name: doctor.name,
                  specialty: doctor.specialty,
                  rating: doctor.rating,
                  distance: doctor.distance,
                  image: doctor.image,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
