import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FontStyles {
  static final title = GoogleFonts.roboto(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );
  static final normal = GoogleFonts.syne(
    fontWeight: FontWeight.w100,
    fontSize: 16,
  );

  static final regular = GoogleFonts.syne(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static final TextTheme textTheme = GoogleFonts.syneTextTheme();
}
