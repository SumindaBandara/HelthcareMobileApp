import 'package:flutter/material.dart';

class SavedDoctorsPage extends StatelessWidget {
  final List<Map<String, String>> savedDoctors = [
    {
      "name": "Dr. Rishi",
      "specialty": "Cardiologist",
      "rating": "4.7",
      "distance": "800m away",
      "image": "assets/doctor1.png", // Add doctor images in assets folder
    },
    {
      "name": "Dr. Rishi",
      "specialty": "Cardiologist",
      "rating": "4.7",
      "distance": "800m away",
      "image": "assets/doctor2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Saved"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: savedDoctors.length,
        itemBuilder: (context, index) {
          final doctor = savedDoctors[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(doctor["image"]!,
                    width: 60, height: 60, fit: BoxFit.cover),
              ),
              title: Text(doctor["name"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor["specialty"]!),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.blue, size: 16),
                      const SizedBox(width: 4),
                      Text(doctor["rating"]!),
                      const SizedBox(width: 8),
                      const Icon(Icons.location_on, size: 16),
                      Text(doctor["distance"]!),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.favorite, color: Colors.blue),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: 3,
      ),
    );
  }
}
