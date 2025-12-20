import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';
import 'package:rent_app/models/brand_model.dart';
import 'package:rent_app/pages/brand_detail_page.dart';

class BrandList extends StatelessWidget {
  final List<BrandModel> brands;

  const BrandList({
    super.key,
    required this.brands,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.125,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.004),
        itemCount: brands.length,
        separatorBuilder: (_, __) => SizedBox(width: screenWidth * 0.03),
        itemBuilder: (context, index) {
          final brand = brands[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BrandDetailPage(brand: brand),
                ),
              );
            },
            child: Container(
              width: screenWidth * 0.22,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * AppConstants.widthPaddingSmall,
                vertical: screenHeight * AppConstants.paddingSmall / 1000,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundWhite,
                borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        brand.image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[400],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * AppConstants.spacingXSmall),
                  Text(
                    brand.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: screenHeight * AppConstants.fontSizeXSmall,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
