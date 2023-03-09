import 'package:flutter/material.dart';
import 'package:my_time/screens/timer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey ),
      home:  TimerHomePage(title: 'My work timer'),
    );
  }
}
