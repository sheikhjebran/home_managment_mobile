import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.poppins(color: Colors.deepPurple, fontSize: 24),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.white70,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: GoogleFonts.poppins(color: Colors.white60, fontSize: 24),
  );
}
