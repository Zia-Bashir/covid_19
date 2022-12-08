import 'package:covid_19/src/utils/app_colors.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  //* -- Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.questrial(
        fontSize: 38.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.fontColor),
    subtitle1: GoogleFonts.poppins(
      fontSize: 17.sp,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: GoogleFonts.questrial(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
  //* -- Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    headline2: GoogleFonts.montserrat(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headline3: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headline4: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    headline5: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    bodyText1: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodyText2: GoogleFonts.poppins(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  );
}
