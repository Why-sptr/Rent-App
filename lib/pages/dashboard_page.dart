import 'package:flutter/material.dart';
import 'package:rent_app/models/car_model.dart';
import 'package:rent_app/data/car_data.dart';
import 'package:rent_app/data/brand_data.dart';
import 'package:rent_app/widgets/brand_list.dart';
import 'package:rent_app/widgets/car_card.dart';
import 'package:rent_app/widgets/cars_list.dart';
import 'package:rent_app/widgets/promo_banner.dart';
import 'package:rent_app/pages/notification_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class DashboardPage extends StatefulWidget {
  final VoidCallback? onNavigateToSearch;
  final VoidCallback? onNavigateToProfile;

  const DashboardPage({
    super.key,
    this.onNavigateToSearch,
    this.onNavigateToProfile,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    const double curveLift = AppConstants.curveLift;
    final double contentGap =
        MediaQuery.of(context).size.height * AppConstants.heightContentGap;

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
                    MediaQuery.of(context).size.width *
                        AppConstants.widthPaddingLarge,
                    MediaQuery.of(context).size.height *
                        AppConstants.spacingLarge,
                    MediaQuery.of(context).size.width *
                        AppConstants.widthPaddingLarge,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.045,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.directions_car_rounded,
                                    size:
                                        MediaQuery.of(context).size.height *
                                        0.04,
                                    color: Colors.white,
                                  );
                                },
                              ),
                            ],
                          ),
                          // Notification Icon
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.025,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.textWhite.withValues(
                                  alpha: AppConstants.alphaButton,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadiusMedium,
                                ),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Icon(
                                    Icons.notifications_outlined,
                                    color: AppColors.textWhite,
                                    size:
                                        MediaQuery.of(context).size.height *
                                        AppConstants.iconSizeMedium,
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
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
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height *
                                      AppConstants.spacingXSmall,
                                ),
                                Text(
                                  'Mobil mana yang Ingin kamu\nsewa hari ini?',
                                  style: AppTextStyles.descriptionText(context),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to profile tab
                              if (widget.onNavigateToProfile != null) {
                                widget.onNavigateToProfile!();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.textWhite,
                                  width: AppConstants.avatarBorderWidth,
                                ),
                              ),
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.075,
                                backgroundColor: Colors.grey[300],
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/avatar.jpg',
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.15,
                                    height:
                                        MediaQuery.of(context).size.width *
                                        0.15,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.person,
                                        size:
                                            MediaQuery.of(context).size.width *
                                            0.1,
                                        color: Colors.grey[600],
                                      );
                                    },
                                  ),
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
                  top: MediaQuery.of(context).size.height * 0.03,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    // Search Bar
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width *
                            AppConstants.widthPaddingLarge,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.backgroundGrey,
                                borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadiusLarge,
                                ),
                              ),
                              child: TextField(
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height *
                                      0.0165,
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: 'Cari mobil',
                                  hintStyle: AppTextStyles.hintGrey(context)
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                            0.0155,
                                      ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey[400],
                                    size:
                                        MediaQuery.of(context).size.height *
                                        AppConstants.iconSizeMedium,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppConstants.paddingLarge,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                        0.018,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width *
                                AppConstants.widthPaddingSmall,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.034,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundWhite,
                              borderRadius: BorderRadius.circular(
                                AppConstants.borderRadiusMedium,
                              ),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: AppConstants.containerBorderWidth,
                              ),
                            ),
                            child: Icon(
                              Icons.tune,
                              color: AppColors.textBlack,
                              size:
                                  MediaQuery.of(context).size.height *
                                  AppConstants.iconSizeMedium,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          AppConstants.spacingXLarge,
                    ),

                    // Brands Section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width *
                            AppConstants.widthPaddingLarge,
                      ),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.018,
                          ),

                          // Brand Grid
                          BrandList(brands: BrandData.brands),
                        ],
                      ),
                    ),

                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          AppConstants.spacingLarge,
                    ),

                    // Best Selling Cars
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width *
                            AppConstants.widthPaddingLarge,
                      ),
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

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),

                    // Cars Horizontal List
                    CarsList(cars: CarData.availableCars),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),

                    // Promo Section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width *
                            AppConstants.widthPaddingLarge,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Promo',
                            style: AppTextStyles.titleBlack(context),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.018,
                          ),
                          const PromoBanner(),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),

                    // Available Cars Grid
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width *
                                AppConstants.widthPaddingLarge,
                          ),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.018,
                        ),

                        // Grid View
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width *
                                AppConstants.widthPaddingLarge,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing:
                                    MediaQuery.of(context).size.width * 0.06,
                                mainAxisSpacing:
                                    MediaQuery.of(context).size.width * 0.06,
                                childAspectRatio:
                                    (MediaQuery.of(context).size.width * 0.42) /
                                    (MediaQuery.of(context).size.height * 0.24),
                              ),
                          itemCount: CarData.availableCars.length,
                          itemBuilder: (context, index) {
                            final car = CarData.availableCars[index];
                            return CarCard(
                              car: car,
                              height: MediaQuery.of(context).size.height * 0.24,
                            );
                          },
                        ),
                      ],
                    ),

                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height * 0.07,
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
