import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dummy_car_rental_ui/showroom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.mulishTextTheme()
      ),
      home: Showroom(),
    );
  }
}