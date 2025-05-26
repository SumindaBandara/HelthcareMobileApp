import 'package:flutter/material.dart';

class Appointment extends StatelessWidget {
  final List<Map<String, String>> appointments = [
    {
      'name': 'Dr. Kevin Perera',
      'specialty': 'Dermatologist',
      'rating': '4.7',
      'status': 'Accepted',
      'image': 'images/doctor2.webp',
    },
    {
      'name': 'Mrs. Jayasooriya',
      'specialty': 'Neurology',
      'rating': '4.5',
      'status': 'Accepted',
      'image': 'images/doctor5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/twelve');
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Appointment',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          var doctor = appointments[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    doctor['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctor['name']!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(doctor['specialty']!,
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.blue, size: 18),
                          const SizedBox(width: 4),
                          Text(doctor['rating']!,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(doctor['status']!,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text('Cancel',
                      style: TextStyle(color: Colors.red, fontSize: 14)),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/one'); // 👈 Home page
              break;
            case 1:
              Navigator.pushReplacementNamed(
                  context, '/reports'); // 👈 Reports page
              break;
            case 2:
              Navigator.pushReplacementNamed(
                  context, '/thirteen'); // 👈 Notifications page
              break;
            case 3:
              Navigator.pushReplacementNamed(
                  context, '/twelve'); // 👈 Profile page
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
