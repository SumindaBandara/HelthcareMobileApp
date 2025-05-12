import 'package:flutter/material.dart';

class Ondaypayment extends StatefulWidget {
  const Ondaypayment({super.key});

  @override
  State<Ondaypayment> createState() => OndaypaymentState();
}

class OndaypaymentState extends State<Ondaypayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50,
            ),
            SizedBox(height: 10),
            Text(
              "Appointment Confirmed",
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.black54),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/one');
                      },
                    ),
                  ),
                  Text("Name", style: TextStyle(color: Colors.grey)),
                  Text(
                    "Ruchitha",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Age", style: TextStyle(color: Colors.grey)),
                  Text(
                    "60",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Phone Number", style: TextStyle(color: Colors.grey)),
                  Text(
                    "077 776 5567",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "To be Payment",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "LKR 2500.00",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/one');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: Text(
                        "Back to Home",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
