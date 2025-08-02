import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class MediPalApp extends StatelessWidget {
  const MediPalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediPal AI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
