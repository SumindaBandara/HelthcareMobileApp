import 'package:flutter/material.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => Onboarding2State();
}

class Onboarding2State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/four');
                    },
                    child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey,
                        )
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  "images/women.png",
                  height: 1000,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find a lot of specialist doctors in one place",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, size: 8, color: Colors.blue),
                          SizedBox(width: 4),
                          Icon(Icons.circle, size: 8, color: Colors.grey),
                        ],
                      ),
                      Spacer(),
                      FloatingActionButton(
                        backgroundColor: Colors.blue,
                        onPressed: () {
                          Navigator.pushNamed(context, '/two'); // Changed '/third' to '/four'
                        },
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
