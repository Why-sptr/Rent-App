import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Gradient
  static const Color primaryBlue = Color(0xFF5B6FEE);
  static const Color primaryPurple = Color(0xFF8B5CF6);
  
  // Gradient Colors
  static const Color gradientStart1 = Color(0xFF6B7FFF);
  static const Color gradientEnd1 = Color(0xFF9C7FFF);
  
  static const Color gradientStart2 = Color(0xFF5B6FEE);
  static const Color gradientEnd2 = Color(0xFFB95CE4);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF1F1F39);
  static const Color textSecondary = Color(0xFF858597);
  static const Color textBlack = Colors.black87;
  static const Color textWhite = Colors.white;
  
  // Background Colors
  static const Color backgroundWhite = Colors.white;
  static const Color backgroundGrey = Color(0xFFF0F2F5);
  static const Color backgroundLightGrey = Color(0xFFF5F5F5);
  
  // Border Colors
  static const Color borderGrey = Color(0xFFE0E0E0);
  static const Color borderRed = Colors.red;
  
  // Icon Colors
  static const Color iconGrey = Colors.grey;
  static const Color iconPrimary = Color(0xFF6B7FFF);
  
  // Other Colors
  static const Color redAccent = Colors.red;
  static const Color facebookBlue = Color(0xFF1877F2);
  
  // Gradient Definitions
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart1, gradientEnd1],
  );
  
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [gradientStart2, gradientEnd2],
  );
  
  static const LinearGradient loginGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryBlue, primaryPurple],
  );
}
