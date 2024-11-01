import 'package:flutter/material.dart';
import 'loading_page.dart';
// import 'login_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoadingPage(), // Start with the LoadingPage
    );
  }
}
