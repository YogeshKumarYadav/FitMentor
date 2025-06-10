import 'package:flutter/material.dart';
import 'slider.dart';

class FitMentor extends StatelessWidget {
  const FitMentor({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "FitMentor",
      theme: ThemeData(
        // primarySwatch: Colors.deepPurple,
        // scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          // bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SliderWidget(),
    );
  }
}