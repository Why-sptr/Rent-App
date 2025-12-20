import 'package:flutter/material.dart';
import 'package:rent_app/models/car_model.dart';
import 'package:rent_app/data/car_data.dart';
import 'package:rent_app/data/brand_data.dart';
import 'package:rent_app/widgets/brand_list.dart';
import 'package:rent_app/widgets/car_card.dart';
import 'package:rent_app/widgets/cars_list.dart';
import 'package:rent_app/widgets/promo_banner.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class DashboardPage extends StatefulWidget {
  final VoidCallback? onNavigateToSearch;

  const DashboardPage({super.key, this.onNavigateToSearch});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    const double curveLift = AppConstants.curveLift;
    final double contentGap = screenHeight * AppConstants.heightContentGap;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenWidth * AppConstants.widthPaddingLarge,
                    screenHeight * AppConstants.spacingLarge,
                    screenWidth * AppConstants.widthPaddingLarge,
                    contentGap + curveLift,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // App Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Logo and Name
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/logo_rentku.png',
                                height: screenHeight * 0.045,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.directions_car_rounded,
                                    size: screenHeight * 0.04,
                                    color: Colors.white,
                                  );
                                },
                              ),
                            ],
                          ),
                          // Notification Icon
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            decoration: BoxDecoration(
                              color: AppColors.textWhite.withValues(alpha: AppConstants.alphaButton),
                              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Icon(
                                  Icons.notifications_outlined,
                                  color: AppColors.textWhite,
                                  size: screenHeight * AppConstants.iconSizeMedium,
                                ),
                                // Notification badge
                                Positioned(
                                  right: -2,
                                  top: -2,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: AppColors.redAccent,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      // User Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pagi, Wahyu',
                                  style: AppTextStyles.greetingText(context),
                                ),
                                SizedBox(height: screenHeight * AppConstants.spacingXSmall),
                                Text(
                                  'Mobil mana yang Ingin kamu\nsewa hari ini?',
                                  style: AppTextStyles.descriptionText(context),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.textWhite,
                                width: AppConstants.avatarBorderWidth,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: screenWidth * 0.075,
                              backgroundColor: Colors.grey[300],
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/avatar.jpg',
                                  fit: BoxFit.cover,
                                  width: screenWidth * 0.15,
                                  height: screenWidth * 0.15,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: screenWidth * 0.1,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Content Section
            Container(
              decoration: const BoxDecoration(
                color: AppColors.backgroundWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.borderRadiusCurved),
                  topRight: Radius.circular(AppConstants.borderRadiusCurved),
                ),
              ),
              transform: Matrix4.translationValues(0, -curveLift, 0),
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                  bottom: screenHeight * 0.02
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),

                    // Search Bar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * AppConstants.widthPaddingLarge),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.backgroundGrey,
                                borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Cari mobil',
                                  hintStyle: AppTextStyles.hintGrey(context),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey[400],
                                    size: screenHeight * AppConstants.iconSizeMedium,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppConstants.paddingLarge,
                                    vertical: screenHeight * 0.018,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * AppConstants.widthPaddingSmall),
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.034),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundWhite,
                              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: AppConstants.containerBorderWidth,
                              ),
                            ),
                            child: Icon(
                              Icons.tune,
                              color: AppColors.textBlack,
                              size: screenHeight * AppConstants.iconSizeMedium,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * AppConstants.spacingXLarge),

                    // Brands Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * AppConstants.widthPaddingLarge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.onNavigateToSearch?.call();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Brands',
                                  style: AppTextStyles.titleBlack(context),
                                ),
                                Text(
                                  'Lihat Semua',
                                  style: AppTextStyles.linkText(context),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.018),

                          // Brand Grid
                          BrandList(brands: BrandData.brands),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * AppConstants.spacingLarge),

                    // Best Selling Cars
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * AppConstants.widthPaddingLarge),
                      child: GestureDetector(
                        onTap: () {
                          widget.onNavigateToSearch?.call();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mobil Terlaris',
                              style: AppTextStyles.titleBlack(context),
                            ),
                            Text(
                              'Lihat Semua',
                              style: AppTextStyles.linkText(context),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.018),

                    // Cars Horizontal List
                    CarsList(cars: CarData.availableCars),

                    SizedBox(height: screenHeight * 0.018),

                    // Promo Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * AppConstants.widthPaddingLarge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Promo',
                            style: AppTextStyles.titleBlack(context),
                          ),
                          SizedBox(height: screenHeight * 0.018),
                          const PromoBanner(),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.018),

                    // Available Cars Grid
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * AppConstants.widthPaddingLarge),
                          child: GestureDetector(
                            onTap: () {
                              widget.onNavigateToSearch?.call();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mobil Tersedia',
                                  style: AppTextStyles.titleBlack(context),
                                ),
                                Text(
                                  'Lihat Semua',
                                  style: AppTextStyles.linkText(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.018),
                        
                        // Grid View
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * AppConstants.widthPaddingLarge),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: screenWidth * 0.06,
                            mainAxisSpacing: screenWidth * 0.06,
                            childAspectRatio: (screenWidth * 0.42) / (screenHeight * 0.24),
                          ),
                          itemCount: CarData.availableCars.length,
                          itemBuilder: (context, index) {
                            final car = CarData.availableCars[index];
                            return CarCard(
                              car: car,
                              height: screenHeight * 0.24,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
