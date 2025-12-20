import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';

class SpecCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const SpecCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.025,
          vertical: screenHeight * 0.018,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundGrey,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.primaryBlue,
              size: screenHeight * 0.024,
            ),
            SizedBox(height: screenHeight * 0.012),
            Text(
              label,
              style: TextStyle(
                fontSize: screenHeight * 0.0135,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Text(
              value,
              style: TextStyle(
                fontSize: screenHeight * 0.017,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
