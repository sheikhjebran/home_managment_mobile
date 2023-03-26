import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline2: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headline3: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: GoogleFonts.poppins(color: Colors.deepPurple, fontSize: 24),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline2: GoogleFonts.montserrat(
      color: Colors.white70,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: GoogleFonts.poppins(color: Colors.white60, fontSize: 24),
  );
}
