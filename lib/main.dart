import 'package:flutter/material.dart';
import 'package:flutter_calculator/components/calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Calculator(),
    );
  }
}
