import 'package:flutter/material.dart';
import 'package:testing_image_picker_upload/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}
