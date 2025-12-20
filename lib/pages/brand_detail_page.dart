import 'package:flutter/material.dart';
import 'package:rent_app/models/brand_model.dart';
import 'package:rent_app/data/car_data.dart';
import 'package:rent_app/widgets/car_card.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class BrandDetailPage extends StatefulWidget {
  final BrandModel brand;

  const BrandDetailPage({
    super.key,
    required this.brand,
  });

  @override
  State<BrandDetailPage> createState() => _BrandDetailPageState();
}

class _BrandDetailPageState extends State<BrandDetailPage> {
  String _selectedFilter = 'Semua';
  TextEditingController searchController = TextEditingController();
  late List<dynamic> filteredCars;

  @override
  void initState() {
    super.initState();
    filteredCars = List.from(CarData.availableCars);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterCars(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCars = List.from(CarData.availableCars);
      } else {
        filteredCars = CarData.availableCars
            .where((car) => car.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
              // Header dengan back button
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge,
                  MediaQuery.of(context).size.height * AppConstants.spacingLarge,
                  MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge,
                  MediaQuery.of(context).size.height * AppConstants.spacingLarge,
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundWhite,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        border: Border.all(
                          color: AppColors.borderGrey,
                          width: AppConstants.containerBorderWidth,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.textBlack,
                        size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                  // Brand Image Container and Info Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Brand Image Container
                      Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundGrey,
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        ),
                        child: Image.asset(
                          widget.brand.image,
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.height * 0.12,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.directions_car,
                              size: MediaQuery.of(context).size.height * 0.12,
                              color: AppColors.iconGrey,
                            );
                          },
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),

                      // Brand Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.brand.name,
                              style: AppTextStyles.titleBlack(context),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                            Text(
                              widget.brand.description,
                              style: AppTextStyles.bodySmall(context),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                                vertical: MediaQuery.of(context).size.height * AppConstants.spacingSmall,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue,
                                borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                              ),
                              child: Text(
                                'Tersedia',
                                style: AppTextStyles.buttonSmall(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

            // Search Bar and Filter
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundGrey,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
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
                            size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppConstants.paddingLarge,
                            vertical: MediaQuery.of(context).size.height * 0.018,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundWhite,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                      border: Border.all(
                        color: AppColors.borderGrey,
                        width: AppConstants.containerBorderWidth,
                      ),
                    ),
                    child: Icon(
                      Icons.tune,
                      color: AppColors.textBlack,
                      size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

            // Filter Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.045,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ['Semua', 'MPV', 'Sedan'].map((filter) {
                    return Padding(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * AppConstants.spacingLarge),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedFilter = filter;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                            vertical: MediaQuery.of(context).size.height * AppConstants.spacingSmall,
                          ),
                          decoration: BoxDecoration(
                            color: _selectedFilter == filter
                                ? AppColors.primaryBlue
                                : AppColors.backgroundWhite,
                            border: Border.all(
                              color: _selectedFilter == filter
                                  ? AppColors.primaryBlue
                                  : AppColors.borderGrey,
                              width: AppConstants.containerBorderWidth,
                            ),
                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                          ),
                          child: Text(
                            filter,
                            style: AppTextStyles.bodySmall(context).copyWith(
                              fontWeight: FontWeight.w600,
                              color: _selectedFilter == filter
                                  ? AppColors.textWhite
                                  : AppColors.textBlack,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

            // Cars Grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge,
                  mainAxisSpacing: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge,
                  childAspectRatio: (MediaQuery.of(context).size.width * 0.42) / (MediaQuery.of(context).size.height * 0.24),
                ),
                itemCount: filteredCars.length,
                itemBuilder: (context, index) {
                  final car = filteredCars[index];
                  return CarCard(
                    car: car,
                    height: MediaQuery.of(context).size.height * 0.24,
                  );
                },
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),
          ],
        ),
        ),
      ),
    );
  }
}
