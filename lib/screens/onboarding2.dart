import 'package:flutter/material.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => Onboarding2State();
}

class Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/four');
                    },
                    child: Text("Skip",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  "images/male.png",
                  height: 600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get advice only from a doctor you believe in.",
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
                          Icon(Icons.circle, size: 8, color: Colors.grey),
                          SizedBox(width: 4),
                          Icon(Icons.circle, size: 8, color: Colors.blue),
                        ],
                      ),
                      Spacer(),
                      FloatingActionButton(
                        backgroundColor: Colors.blue,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/four'); // Changed '/third' to '/four'
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
