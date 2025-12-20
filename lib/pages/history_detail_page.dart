import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';
import 'package:rent_app/widgets/spec_card.dart';
import 'package:rent_app/pages/check_in_page.dart';

class HistoryDetailPage extends StatelessWidget {
  final Map<String, dynamic> booking;
  
  const HistoryDetailPage({
    super.key,
    required this.booking,
  });

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * AppConstants.widthPaddingLarge,
              vertical: screenHeight * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                SizedBox(
                  height: screenHeight * 0.06,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.all(screenWidth * 0.028),
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
                              size: screenHeight * 0.022,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Detail Pesanan',
                          style: AppTextStyles.titleBlack(context),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(width: screenWidth * 0.13),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // Car info tile
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenHeight * 0.11,
                      width: screenWidth * 0.40,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundGrey,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Center(
                        child: Image.asset(
                          booking['carImage'],
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.directions_car,
                            size: screenHeight * 0.06,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            booking['carName'],
                            style: TextStyle(
                              fontSize: screenHeight * 0.0195,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textBlack,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.006),
                          Text(
                            '${booking['transmission']}, ${booking['maxSpeed']} KM/J, ${booking['capacity']} Orang',
                            style: TextStyle(
                              fontSize: screenHeight * 0.0135,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.025,
                              vertical: screenHeight * 0.004,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'SUV',
                              style: TextStyle(
                                fontSize: screenHeight * 0.0115,
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

                SizedBox(height: screenHeight * 0.02),

                // Spec Cards
                Row(
                  children: [
                    SpecCard(
                      icon: Icons.settings_outlined,
                      label: 'Transmisi',
                      value: booking['transmission'],
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    SpecCard(
                      icon: Icons.speed,
                      label: 'Maks. Kecepatan',
                      value: '${booking['maxSpeed']} KM/J',
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    SpecCard(
                      icon: Icons.airline_seat_recline_normal,
                      label: 'Kapasitas',
                      value: '${booking['capacity']} Orang',
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),

                // Detail Pesanan card
                _shadowCard(
                  context,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail Pesanan',
                          style: TextStyle(
                            fontSize: screenHeight * 0.0195,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.016),
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
                                      fontSize: screenHeight * 0.0155,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlack,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.003),
                                  Text(
                                    booking['duration'],
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.0135,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.018),
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
                                      fontSize: screenHeight * 0.0155,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlack,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.003),
                                  Text(
                                    booking['location'],
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.0135,
                                      color: Colors.grey[600],
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
                ),

                SizedBox(height: screenHeight * 0.02),

                // Rincian Pembayaran card
                _shadowCard(
                  context,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rincian Pembayaran',
                          style: TextStyle(
                            fontSize: screenHeight * 0.0195,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.016),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                booking['priceDetail'],
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0135,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Text(
                              _formatPrice(booking['subtotal']),
                              style: TextStyle(
                                fontSize: screenHeight * 0.0155,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.010),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Admin',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0135,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Text(
                              'Rp. 2.500',
                              style: TextStyle(
                                fontSize: screenHeight * 0.0135,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Divider(height: screenHeight * 0.030, thickness: 1),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0155,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlack,
                                ),
                              ),
                            ),
                            Text(
                              _formatPrice(booking['total']),
                              style: TextStyle(
                                fontSize: screenHeight * 0.0155,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.016),
                        Divider(height: screenHeight * 0.010, thickness: 1),
                        SizedBox(height: screenHeight * 0.016),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Metode Pembayaran',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0155,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlack,
                                ),
                              ),
                            ),
                            Text(
                              booking['paymentMethod'],
                              style: TextStyle(
                                fontSize: screenHeight * 0.0155,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.026),

                // Buttons Row
                Row(
                  children: [
                    // Cancel button
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundWhite,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.primaryBlue,
                            width: 2,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // Show confirmation dialog
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                                  ),
                                  title: Text(
                                    'Batalkan Pesanan?',
                                    style: AppTextStyles.titleBlack(context),
                                  ),
                                  content: Text(
                                    'Apakah Anda yakin ingin membatalkan pesanan ini?',
                                    style: AppTextStyles.bodyLarge(context).copyWith(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'Tidak',
                                        style: AppTextStyles.bodyMedium(context).copyWith(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: AppColors.buttonGradient,
                                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context); // Close dialog
                                          Navigator.pop(context); // Back to previous page
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Pesanan dibatalkan'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Ya, Batalkan',
                                          style: AppTextStyles.bodyMedium(context).copyWith(
                                            color: AppColors.textWhite,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                              child: Center(
                                child: Text(
                                  'Batalkan',
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.0175,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryBlue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    // Check In button
                    Expanded(
                      child: Container(
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
                                  builder: (context) => CheckInPage(booking: booking),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                              child: Center(
                                child: Text(
                                  'Check In',
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.0175,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ),
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
    );
  }
}
