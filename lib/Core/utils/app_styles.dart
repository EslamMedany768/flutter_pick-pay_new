import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Core/utils/app_colors.dart';


class AppStyles {
  static final TextStyle extraBold18white = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w800,
    fontFamily: "Poppins",
    fontSize: 18,
  );
  static final TextStyle light18blue = GoogleFonts.poppins(
    color: AppColors.blue,
    fontWeight: FontWeight.w300,
    fontSize: 18,
  );
  static final TextStyle light14blue = GoogleFonts.poppins(
    color: AppColors.blue,
    fontWeight: FontWeight.w300,
    fontSize: 14,
  );
  static final TextStyle medium16grey = GoogleFonts.inter(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static final TextStyle medium20white = GoogleFonts.poppins(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  static final TextStyle medium20blue = GoogleFonts.poppins(
    color: AppColors.blue,
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  static final TextStyle medium14white = GoogleFonts.poppins(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static final TextStyle semiBold20blue = GoogleFonts.inter(
    color: AppColors.blue,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  static final TextStyle extraBold24Blue = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.blue,
  );
  static final TextStyle medium18blueDark = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.blueDark,
  );
  static final TextStyle medium16blueDark = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blueDark,
  );
  static final TextStyle medium18grey = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  static final TextStyle regular14blueDark = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.blueDark,
  );
  static final TextStyle medium20blueDark = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.blueDark,
  );
}
