import 'package:flutter/material.dart';
import 'package:myproject/screens/auth/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SigninPage(),
    );
  }
}
