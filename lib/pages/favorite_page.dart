import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:rent_app/models/car_model.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';
import 'package:rent_app/widgets/car_card.dart';
import 'package:rent_app/data/car_data.dart';

final carData = CarData.availableCars;

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<CarModel> favoriteCars = [];
  List<CarModel> filteredCars = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterCars(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCars = List.from(favoriteCars);
      } else {
        filteredCars = favoriteCars
            .where((car) => car.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoriteIds = prefs.getStringList('favoriteCarIds') ?? [];
      
      setState(() {
        favoriteCars = carData
            .where((car) => favoriteIds.contains(car.id))
            .toList();
        filteredCars = List.from(favoriteCars);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _removeFavorite(String carId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoriteIds = prefs.getStringList('favoriteCarIds') ?? [];
      favoriteIds.remove(carId);
      await prefs.setStringList('favoriteCarIds', favoriteIds);
      // Refresh lists and reapply search filter if any
      await _loadFavorites();
      if (searchController.text.isNotEmpty) {
        filterCars(searchController.text);
      }
    } catch (e) {
      print('Error removing favorite: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Back Button
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                  vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    Text(
                      'Favorit',
                      style: AppTextStyles.titleBlack(context),
                    ),
                    Container(
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
                        Icons.tune,
                        color: AppColors.textBlack,
                        size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),

              // Search bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLightGrey,
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: filterCars,
                    style: AppTextStyles.bodyMedium(context),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Cari mobil',
                      hintStyle: AppTextStyles.hint(context),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.iconGrey,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                        vertical: MediaQuery.of(context).size.height * AppConstants.spacingSmall,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

              // Content
              if (isLoading)
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                    child: CircularProgressIndicator(
                      color: AppColors.primaryBlue,
                    ),
                  ),
                )
              else if (favoriteCars.isEmpty)
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: MediaQuery.of(context).size.height * 0.1,
                          color: AppColors.borderGrey,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),
                        Text(
                          'Belum ada favorit',
                          style: AppTextStyles.bodyLarge(context).copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.iconGrey,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                        Text(
                          'Tambahkan mobil favorit Anda',
                          style: AppTextStyles.bodySmall(context).copyWith(
                            color: AppColors.iconGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                    vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                    crossAxisSpacing: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall,
                    mainAxisSpacing: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                  ),
                  itemCount: filteredCars.length,
                  itemBuilder: (context, index) {
                    final car = filteredCars[index];
                    return Stack(
                      children: [
                        CarCard(car: car),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.01,
                          right: MediaQuery.of(context).size.width * 0.02,
                          child: GestureDetector(
                            onTap: () {
                              _removeFavorite(car.id);
                            },
                            child: Container(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundWhite,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: AppColors.redAccent,
                                size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

