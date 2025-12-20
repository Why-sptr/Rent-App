import 'package:flutter/material.dart';
import 'package:rent_app/models/car_model.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rent_app/widgets/spec_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rent_app/pages/booking_page.dart';

class CarDetailPage extends StatefulWidget {
  final CarModel car;

  const CarDetailPage({
    super.key,
    required this.car,
  });

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoriteIds = prefs.getStringList('favoriteCarIds') ?? [];
      setState(() {
        isFavorite = favoriteIds.contains(widget.car.id);
      });
    } catch (e) {
      print('Error checking favorite: $e');
    }
  }

  Future<void> _toggleFavorite() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoriteIds = prefs.getStringList('favoriteCarIds') ?? [];
      
      if (isFavorite) {
        favoriteIds.remove(widget.car.id);
      } else {
        favoriteIds.add(widget.car.id);
      }
      
      await prefs.setStringList('favoriteCarIds', favoriteIds);
      setState(() {
        isFavorite = !isFavorite;
      });
    } catch (e) {
      print('Error toggling favorite: $e');
    }
  }

  String _formatPrice(int price) {
    final s = price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return 'Rp$s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header dengan back button, title, filter
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                      vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        // Title
                        Text(
                          'Detail Mobil',
                          style: AppTextStyles.titleBlack(context),
                        ),
                        // Heart Button
                        GestureDetector(
                          onTap: _toggleFavorite,
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
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? AppColors.redAccent : AppColors.textBlack,
                              size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                // Car Image
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.28,
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                    child: Image.asset(
                      widget.car.image,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.directions_car,
                            size: MediaQuery.of(context).size.height * 0.08,
                            color: AppColors.iconGrey,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                // Car Name
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                  child: Text(
                    widget.car.name,
                    style: AppTextStyles.titleLarge(context),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                // Horizontal Line Divider
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                  child: Divider(
                    color: AppColors.borderGrey,
                    thickness: AppConstants.containerBorderWidth,
                    height: 0,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                // Spesifikasi Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spesifikasi',
                        style: AppTextStyles.titleBlack(context),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),

                      // Spec Cards Row
                      Row(
                        children: [
                          SpecCard(
                            icon: Icons.settings_outlined,
                            label: 'Transmisi',
                            value: widget.car.transmission,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                          SpecCard(
                            icon: Icons.speed,
                            label: 'Maks. Kecepatan',
                            value: '${widget.car.maxSpeed}km/j',
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          SpecCard(
                            icon: Icons.people_outline,
                            label: 'Kapasitas',
                            value: '${widget.car.capacity} Orang',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

                // Lokasi Pickup Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lokasi Pickup',
                        style: AppTextStyles.titleBlack(context),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall + 2),
                          border: Border.all(
                            color: AppColors.borderGrey,
                            width: AppConstants.containerBorderWidth,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall + 2),
                          child: FlutterMap(
                            options: MapOptions(
                              initialCenter: const LatLng(-6.2088, 106.8456),
                              initialZoom: 13,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.rent_app',
                              ),
                              RichAttributionWidget(
                                attributions: [
                                  TextSourceAttribution(
                                    'OpenStreetMap contributors',
                                    onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                                  ),
                                ],
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: const LatLng(-6.2088, 106.8456),
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.location_on,
                                      color: AppColors.primaryBlue,
                                      size: MediaQuery.of(context).size.height * AppConstants.iconSizeLarge,
                                    ),
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

                SizedBox(height: MediaQuery.of(context).size.height * 0.14),
              ],
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Harga Rental',
                          style: AppTextStyles.label(context).copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall),
                        Text(
                          '${_formatPrice(widget.car.price)}/hari',
                          style: AppTextStyles.titleBlack(context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.gradientStart1,
                            AppColors.gradientEnd1,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall + 2),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Navigate to booking page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(car: widget.car),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall + 2),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                            child: Center(
                              child: Text(
                                'Rental Sekarang',
                                style: AppTextStyles.button(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
