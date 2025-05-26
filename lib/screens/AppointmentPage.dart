import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/services/appointment_service.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  List<Map<String, dynamic>> appointments = [];
  bool isLoading = true;

  final Color primaryColor = Color.fromARGB(255, 1, 99, 61); // Light teal
  final Color accentColor = Color.fromARGB(255, 0, 150, 236); // Teal green
  final Color lightBackground = Color(0xFFF0FDFB); // Very light teal

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('appointments')
          .orderBy('createdAt', descending: true) // ⬅️ Sort by latest first
          .get();

      final data = querySnapshot.docs.map((doc) {
        final appointmentData = doc.data() as Map<String, dynamic>;
        appointmentData['id'] = doc.id;
        return appointmentData;
      }).toList();

      setState(() {
        appointments = data;
        isLoading = false;
      });
    } catch (e) {
      print('❌ Error fetching appointments: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/twelve'),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'My Appointments',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: accentColor))
          : appointments.isEmpty
              ? Center(
                  child: Text(
                    "No appointments found.",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    var a = appointments[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      color: Colors.white,
                      shadowColor: accentColor.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(a['doctorName'] ?? '',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: accentColor)),
                            SizedBox(height: 4),
                            Text(a['specialty'] ?? '',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 14)),
                            Divider(height: 24, thickness: 1),
                            Row(children: [
                              Icon(Icons.person, color: primaryColor),
                              SizedBox(width: 8),
                              Text("Patient: ${a['patientName'] ?? ''}",
                                  style: TextStyle(fontSize: 14))
                            ]),
                            SizedBox(height: 6),
                            Row(children: [
                              Icon(Icons.calendar_today, color: primaryColor),
                              SizedBox(width: 8),
                              Text("Date: ${a['date'] ?? ''}",
                                  style: TextStyle(fontSize: 14))
                            ]),
                            SizedBox(height: 6),
                            Row(children: [
                              Icon(Icons.access_time, color: primaryColor),
                              SizedBox(width: 8),
                              Text("Time: ${a['time'] ?? ''}",
                                  style: TextStyle(fontSize: 14))
                            ]),
                            SizedBox(height: 6),
                            Row(children: [
                              Icon(Icons.payment, color: primaryColor),
                              SizedBox(width: 8),
                              Text("Payment: ${a['paymentMethod'] ?? ''}",
                                  style: TextStyle(fontSize: 14))
                            ]),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Cancel Appointment"),
                                      content: Text(
                                          "Are you sure you want to cancel this appointment?"),
                                      actions: [
                                        TextButton(
                                          child: Text("No"),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                        TextButton(
                                          child: Text("Yes",
                                              style: TextStyle(
                                                  color: Colors.redAccent)),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            await AppointmentService
                                                .deleteAppointment(a['id']);
                                            await fetchAppointments();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon:
                                    Icon(Icons.cancel, color: Colors.redAccent),
                                label: Text('Cancel',
                                    style: TextStyle(color: Colors.redAccent)),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.redAccent),
                                  shape: StadiumBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: accentColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/one');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/reports');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/thirteen');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/twelve');
              break;
          }
        },
        items: const [
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
