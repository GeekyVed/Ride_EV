import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xD9000000), // 85% opacity
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      // Add more text styles as needed
    ),
  );
}
