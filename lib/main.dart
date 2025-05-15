import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/Sign_in.dart';
import 'package:untitled/screens/Sign_up.dart';
import 'package:untitled/screens/onboarding1.dart';
import 'package:untitled/screens/onboarding2.dart';
import 'package:untitled/screens/topdoctor.dart';
import 'package:untitled/screens/user.dart';
import 'package:untitled/screens/CheckOut.dart';
import 'package:untitled/screens/doctordetails.dart';
import 'package:untitled/screens/BookAppointment.dart';
import 'package:untitled/screens/CheckOut.dart';
import 'package:untitled/screens/ondaypayment.dart';
import 'package:untitled/screens/paymentsucess.dart';
import 'package:untitled/screens/Profile.dart';
import 'package:untitled/screens/Notification.dart';
import 'package:untitled/screens/SavedDoctorsPage.dart';
import 'package:untitled/screens/AppointmentPage.dart';
import 'package:untitled/screens/AI/find_doctor_screen.dart';
import 'package:untitled/screens/AI/symptom_checker_screen.dart';

import 'screens/home1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Onboarding1(),
        '/one': (context) => Home1(),
        '/two': (context) => Onboarding2(),
        '/four': (context) => Onboarding3(),
        '/three': (context) => TopDoctorsScreen(),
        '/five': (context) => Sign_in(),
        '/six': (context) => Sign_up(),
        '/seven': (context) => DoctorDetailScreen(),
        '/eight': (context) => AppointmentScreen(),
        '/nine': (context) => Checkout(),
        '/ten': (context) => Ondaypayment(),
        '/eleven': (context) => Paymentsucess(),
        '/twelve': (context) => ProfileScreen(),
        '/thirteen': (context) => NotificationsScreen(),
        '/fourteen': (context) => MySavedScreen(),
        '/fifteen': (context) => Appointment(),
        '/sixteen': (context) => FindDoctorScreen(),
        '/seventeen': (context) => SymptomCheckerScreen(),
      },
    );
  }
}
