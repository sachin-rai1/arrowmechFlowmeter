import 'package:arrowmech/ContactUs/ContactUs.dart';
import 'package:arrowmech/Login/LoginPageView.dart';
import 'package:arrowmech/View/ReportView.dart';
import 'package:arrowmech/View/SubMachine.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/SubMachine': (context) => const SubMachine(),
        '/ReportView': (context) => const ReportView(),
        '/ContactUs': (context) => const ContactUs(),
      },
    );
  }
}

