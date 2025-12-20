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
  final String? searchType; // 'brands', 'best_selling', 'available', or null
  final bool? isEmbedded; // true jika embedded di main_page, false jika pushed

  const SearchProductPage({
    super.key,
    this.searchType,
    this.isEmbedded,
  });

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
            .where((car) => car.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0165,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Cari mobil',
                        hintStyle: AppTextStyles.hintGrey(context).copyWith(
                          fontSize: MediaQuery.of(context).size.height * 0.0155,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[400],
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
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.034),
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
                    size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.03),

          // Brands Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semua Brand',
                  style: AppTextStyles.titleBlack(context),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.018),
                // Brand Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.04,
                    mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: BrandData.brands.length,
                  itemBuilder: (context, index) {
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
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          border: Border.all(
                            color: Colors.grey[300]!,
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
                                  color: Colors.grey[400],
                                );
                              },
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            Text(
                              brand.name,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * AppConstants.fontSizeXSmall,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                // Mobil Tersedia Section
                Text(
                  'Mobil Tersedia',
                  style: AppTextStyles.titleBlack(context),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.018),

                // Cars Grid
                if (displayedCars.isNotEmpty)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: MediaQuery.of(context).size.width * 0.06,
                      mainAxisSpacing: MediaQuery.of(context).size.width * 0.06,
                      childAspectRatio: (MediaQuery.of(context).size.width * 0.42) / (MediaQuery.of(context).size.height * 0.24),
                    ),
                    itemCount: displayedCars.length,
                    itemBuilder: (context, index) {
                      final car = displayedCars[index];
                      return CarCard(
                        car: car,
                        height: MediaQuery.of(context).size.height * 0.24,
                      );
                    },
                  )
                else
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
                      child: Column(
                        children: [
                          Icon(
                            Icons.directions_car_outlined,
                            size: MediaQuery.of(context).size.height * 0.08,
                            color: Colors.grey[300],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Text(
                            'Mobil tidak ditemukan',
                            style: AppTextStyles.hintGrey(context),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ],
      ),
    ),
    );

    // Return Scaffold untuk semua kasus
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: body,
    );
  }
}
