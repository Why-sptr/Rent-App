import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';

class PromoBanner extends StatelessWidget {
  final String imageAsset;

  const PromoBanner({
    super.key,
    this.imageAsset = 'assets/images/Promo.png',
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
      child: Image.asset(
        imageAsset,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
            ),
            child: Center(
              child: Icon(
                Icons.image_not_supported,
                color: Colors.grey[400],
                size: 48,
              ),
            ),
          );
        },
      ),
    );
  }
}
