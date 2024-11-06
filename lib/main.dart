import 'package:flutter/material.dart';
import 'group_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Types App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GroupListScreen(),
    );
  }
}
