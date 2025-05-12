import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int _selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/doctor.jpg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. Vaamana",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Dentists", style: TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.blue),
                          Text(" 4.7"),
                          SizedBox(width: 10),
                          Icon(Icons.location_on, color: Colors.grey),
                          Text(" 800m away"),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Text("Patient details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(decoration: InputDecoration(hintText: "Name")),
              TextField(decoration: InputDecoration(hintText: "Age")),
              TextField(decoration: InputDecoration(hintText: "Phone Number")),
              SizedBox(height: 20),
              Text("Total cost",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("LKR 2500.00", style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text("Payment options",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Radio(
                  value: 0,
                  groupValue: _selectedPayment,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedPayment = value!;
                    });
                  },
                ),
                title: Text("Card Payment"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.credit_card, color: Colors.blue),
                    Icon(Icons.payment, color: Colors.blue),
                  ],
                ),
              ),
              ListTile(
                leading: Radio(
                  value: 1,
                  groupValue: _selectedPayment,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedPayment = value!;
                    });
                  },
                ),
                title: Text("On day Payment"),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                child: Text("Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
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
