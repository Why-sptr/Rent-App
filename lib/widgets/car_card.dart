import 'package:flutter/material.dart';
import 'package:rent_app/models/car_model.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';

class CarCard extends StatelessWidget {
  final CarModel car;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const CarCard({
    super.key,
    required this.car,
    this.height,
    this.margin,
  });

  String _formatPrice(int price) {
    final s = price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return 'Rp$s';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final radius = 18.0;

    return Container(
      height: height ?? screenHeight * 0.26,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(radius + 2),
        border: Border.all(color: Colors.black.withOpacity(0.04), width: AppConstants.containerBorderWidth),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 12,
            spreadRadius: 0,
            offset: Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: (height ?? screenHeight * 0.26) * 0.48,
            color: AppColors.backgroundGrey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingSmall, vertical: AppConstants.paddingXSmall),
                child: Image.asset(
                  car.image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.directions_car,
                    size: screenHeight * 0.06,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          ),

          Container(height: 1, color: Colors.black.withOpacity(0.05)),

          // Content section
          Expanded(
            child: Container(
              color: AppColors.backgroundWhite,
              padding: const EdgeInsets.fromLTRB(14, AppConstants.paddingSmall, 14, AppConstants.paddingSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: screenHeight * 0.0165,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: screenHeight * 0.014,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          car.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: screenHeight * 0.0125,
                            color: Colors.grey[500],
                            height: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.settings_outlined,
                              size: screenHeight * 0.013,
                              color: AppColors.iconPrimary,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                car.transmission,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0115,
                                  color: AppColors.iconPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: _formatPrice(car.price),
                              style: TextStyle(
                                fontSize: screenHeight * 0.0125,
                                color: AppColors.textBlack,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: '/Hari',
                              style: TextStyle(
                                fontSize: screenHeight * 0.011,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
