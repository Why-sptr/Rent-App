import 'package:flutter/material.dart';
import 'package:rent_app/models/car_model.dart';
import 'package:rent_app/data/car_data.dart';
import 'package:rent_app/data/brand_data.dart';
import 'package:rent_app/widgets/car_card.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';
import 'package:rent_app/pages/brand_detail_page.dart';

class SearchProductPage extends StatefulWidget {
  final String? searchType;
  final bool? isEmbedded;

  const SearchProductPage({super.key, this.searchType, this.isEmbedded});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  late List<CarModel> displayedCars;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedCars = List.from(CarData.availableCars);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterCars(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedCars = List.from(CarData.availableCars);
      } else {
        displayedCars = CarData.availableCars
            .where(
              (car) => car.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Header dengan Search Bar
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width *
                      AppConstants.widthPaddingLarge,
                  vertical:
                      MediaQuery.of(context).size.height *
                      AppConstants.spacingMedium,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          AppConstants.spacingXLarge,
                    ),
                    // Search Bar and Filter
                    Row(
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
                              controller: searchController,
                              onChanged: filterCars,
                              style: AppTextStyles.bodyLarge(context),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: 'Cari mobil',
                                hintStyle: AppTextStyles.hintGrey(context),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.iconGrey,
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
                            MediaQuery.of(context).size.width *
                                AppConstants.widthPaddingMedium,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundWhite,
                            borderRadius: BorderRadius.circular(
                              AppConstants.borderRadiusMedium,
                            ),
                            border: Border.all(
                              color: AppColors.borderGrey,
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
                  ],
                ),
              ),
            ),
          ),

          // Brands Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width *
                    AppConstants.widthPaddingLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height *
                        AppConstants.spacingXLarge,
                  ),
                  Text('Semua Brand', style: AppTextStyles.titleBlack(context)),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height *
                        AppConstants.spacingMedium,
                  ),
                ],
              ),
            ),
          ),

          // Brand Grid
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.width *
                  AppConstants.widthPaddingLarge,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing:
                    MediaQuery.of(context).size.width *
                    AppConstants.widthPaddingMedium,
                mainAxisSpacing:
                    MediaQuery.of(context).size.height *
                    AppConstants.spacingLarge,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final brand = BrandData.brands[index];
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadiusMedium,
                      ),
                      border: Border.all(
                        color: AppColors.borderGrey,
                        width: AppConstants.containerBorderWidth,
                      ),
                      color: AppColors.backgroundWhite,
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
                        Image.asset(
                          brand.image,
                          height: MediaQuery.of(context).size.height * 0.08,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.directions_car,
                              size: MediaQuery.of(context).size.height * 0.08,
                              color: AppColors.iconGrey,
                            );
                          },
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height *
                              AppConstants.spacingSmall,
                        ),
                        Text(
                          brand.name,
                          style: AppTextStyles.bodySmall(
                            context,
                          ).copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: BrandData.brands.length),
            ),
          ),

          // Mobil Tersedia Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width *
                    AppConstants.widthPaddingLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height *
                        AppConstants.spacingXLarge,
                  ),
                  Text(
                    'Mobil Tersedia',
                    style: AppTextStyles.titleBlack(context),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height *
                        AppConstants.spacingMedium,
                  ),
                ],
              ),
            ),
          ),

          // Cars Grid
          if (displayedCars.isNotEmpty)
            SliverPadding(
              padding: EdgeInsets.only(
                left:
                    MediaQuery.of(context).size.width *
                    AppConstants.widthPaddingLarge,
                right:
                    MediaQuery.of(context).size.width *
                    AppConstants.widthPaddingLarge,
                bottom:
                    MediaQuery.of(context).size.height * 0.13,
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing:
                      MediaQuery.of(context).size.width *
                      AppConstants.widthPaddingLarge,
                  mainAxisSpacing:
                      MediaQuery.of(context).size.width *
                      AppConstants.widthPaddingLarge,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width * 0.42) /
                      (MediaQuery.of(context).size.height * 0.24),
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final car = displayedCars[index];
                  return CarCard(
                    car: car,
                    height: MediaQuery.of(context).size.height * 0.24,
                  );
                }, childCount: displayedCars.length),
              ),
            )
          else
            SliverPadding(
              padding: EdgeInsets.only(
                bottom:
                    MediaQuery.of(context).size.height *
                    AppConstants.spacingXLarge,
              ),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.directions_car_outlined,
                          size: MediaQuery.of(context).size.height * 0.08,
                          color: AppColors.iconGrey,
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height *
                              AppConstants.spacingLarge,
                        ),
                        Text(
                          'Mobil tidak ditemukan',
                          style: AppTextStyles.hintGrey(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
