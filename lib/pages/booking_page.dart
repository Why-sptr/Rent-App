import 'package:flutter/material.dart';
import 'package:rent_app/models/car_model.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';
import 'package:rent_app/pages/payment_method_page.dart';

class BookingPage extends StatelessWidget {
  final CarModel car;
  const BookingPage({super.key, required this.car});

  String _formatPrice(int price) {
    final s = price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return 'Rp$s';
  }

  Widget _shadowCard(BuildContext context, {required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
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
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge,
              vertical: MediaQuery.of(context).size.height * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: back + centered title + optional right space
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.028),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundWhite,
                              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: AppConstants.containerBorderWidth,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.textBlack,
                              size: MediaQuery.of(context).size.height * 0.022,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Rincian',
                          style: AppTextStyles.titleBlack(context),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(width: MediaQuery.of(context).size.width * 0.13),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                // Car info tile (no card wrapper)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.11,
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundGrey,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Center(
                        child: Image.asset(
                          car.image,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.directions_car,
                            size: MediaQuery.of(context).size.height * 0.06,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            car.name,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.0195,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textBlack,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.006),
                          Text(
                            '${car.transmission}, ${car.maxSpeed} KM/J, ${car.capacity} Orang',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.0135,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.025,
                              vertical: MediaQuery.of(context).size.height * 0.004,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'SUV',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.0115,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                // Detail Pesanan card
                _shadowCard(
                  context,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail Pesanan',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.0195,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Durasi Sewa',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.0155,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlack,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                                  Text(
                                    '2 Hari',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.0135,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.edit_outlined, color: AppColors.textBlack, size: MediaQuery.of(context).size.height * 0.02),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.018),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lokasi Penjemputan',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.0155,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlack,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                                  Text(
                                    car.location,
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.0135,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.edit_outlined, color: AppColors.textBlack, size: MediaQuery.of(context).size.height * 0.02),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                // Rincian Pembayaran card
                _shadowCard(
                  context,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rincian Pembayaran',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.0195,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '2 Hari X  Rp. ${car.price ~/ 1000}.000',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.0135,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Text(
                              _formatPrice(car.price * 2),
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.0155,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Admin',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.0135,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Text(
                              'Rp. 2.500',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.0135,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Divider(height: MediaQuery.of(context).size.height * 0.030, thickness: 1),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.0155,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlack,
                                ),
                              ),
                            ),
                            Text(
                              _formatPrice(car.price * 2 + 2500),
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.0155,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.026),

                // Bottom Gradient Button
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.gradientStart1,
                        AppColors.gradientEnd1,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentMethodPage(car: car),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.018),
                        child: Center(
                          child: Text(
                            'Lanjutkan',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.0175,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textWhite,
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
      ),
    );
  }
}
