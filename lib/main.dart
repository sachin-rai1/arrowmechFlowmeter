import 'package:arrowmech/ContactUs/ContactUs.dart';
import 'package:arrowmech/Login/LoginPageView.dart';
import 'package:arrowmech/Login/Register.dart';
import 'package:arrowmech/View/ReportView.dart';
import 'package:arrowmech/View/SubMachine.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const SignUp(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/SubMachine': (context) => const SubMachine(),
        '/ReportView': (context) => const ReportView(),
        '/ContactUs': (context) => const ContactUs(),
        '/SignUp': (context) =>  const SignUp(),
      },
    );
  }
}
