import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';

class AppTextStyles {
  // Helper method to get responsive font size
  static double _getResponsiveFontSize(BuildContext context, double multiplier) {
    return MediaQuery.of(context).size.height * multiplier;
  }
  
  // Headers
  static TextStyle header(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeHeader),
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static TextStyle headerWhite(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeHeader),
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );
  
  // Titles
  static TextStyle title(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeTitle),
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );
  
  static TextStyle titleBlack(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeLarge),
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );
  
  static TextStyle titleMedium(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeXLarge),
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );
  
  // Body Text
  static TextStyle bodyLarge(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeNormal),
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static TextStyle bodyMedium(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeMedium),
    color: AppColors.textSecondary,
  );
  
  static TextStyle bodySmall(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeSmall),
    color: AppColors.textSecondary,
  );
  
  static TextStyle bodyWhite(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeMedium),
    fontWeight: FontWeight.w400,
    color: AppColors.textWhite.withValues(alpha: AppConstants.alphaMedium),
  );
  
  // Subtitles
  static TextStyle subtitle(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeXSmall),
    color: Colors.grey[600],
  );
  
  static TextStyle subtitleWhite(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeNormal),
    fontWeight: FontWeight.w500,
    color: AppColors.textWhite.withValues(alpha: AppConstants.alphaMedium),
  );
  
  // Labels
  static TextStyle label(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeXSmall),
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
  );
  
  static TextStyle labelMedium(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeSmall),
    color: AppColors.textWhite,
    fontWeight: FontWeight.w500,
  );
  
  // Buttons
  static TextStyle button(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeNormal),
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );
  
  static TextStyle buttonSmall(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeSmall),
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );
  
  // Hints
  static TextStyle hint(BuildContext context) => TextStyle(
    color: AppColors.textPrimary.withValues(alpha: AppConstants.alphaHint),
  );
  
  static TextStyle hintGrey(BuildContext context) => TextStyle(
    color: Colors.grey[400],
    fontSize: _getResponsiveFontSize(context, 0.019),
    fontWeight: FontWeight.w400,
  );
  
  // Special Text Styles
  static TextStyle greetingText(BuildContext context) => TextStyle(
    color: AppColors.textWhite,
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeTitle),
    fontWeight: FontWeight.w600,
  );
  
  static TextStyle descriptionText(BuildContext context) => TextStyle(
    color: AppColors.textWhite.withValues(alpha: AppConstants.alphaLow),
    fontSize: _getResponsiveFontSize(context, 0.017),
    height: 1.35,
    fontWeight: FontWeight.w400,
  );
  
  static TextStyle linkText(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, AppConstants.fontSizeMedium),
    color: AppColors.iconPrimary,
    fontWeight: FontWeight.w500,
  );
}
