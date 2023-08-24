import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());


class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF0B0D22),   // To define the color of the App Bar
        ),
        scaffoldBackgroundColor: const Color(0xFF0B0D22),   // The background color
      ),
      home: const InputPage(),
    );
  }
}


