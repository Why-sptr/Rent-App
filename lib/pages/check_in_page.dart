import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class CheckInPage extends StatelessWidget {
  final Map<String, dynamic> booking;

  const CheckInPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * AppConstants.widthPaddingLarge,
                vertical: h * 0.015,
              ),
              child: SizedBox(
                height: h * 0.06,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(w * 0.028),
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
                            size: h * 0.022,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Check In',
                        style: AppTextStyles.titleBlack(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(width: w * 0.12),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: h * 0.02),

            // QR Code Section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * AppConstants.widthPaddingLarge),
                  child: Column(
                    children: [
                      // Info Card
                      Container(
                        padding: EdgeInsets.all(w * 0.04),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundGrey,
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Scan QR Code untuk Check In',
                              style: TextStyle(
                                fontSize: h * 0.018,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textBlack,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: h * 0.008),
                            Text(
                              'Tunjukkan QR Code ini ke petugas untuk melakukan check in',
                              style: TextStyle(
                                fontSize: h * 0.014,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.03),

                      // QR Code
                      Container(
                        padding: EdgeInsets.all(w * 0.06),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundWhite,
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              spreadRadius: 0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/qr.png',
                          width: w * 0.6,
                          height: w * 0.6,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Container(
                            width: w * 0.6,
                            height: w * 0.6,
                            color: Colors.grey[200],
                            child: Icon(
                              Icons.qr_code,
                              size: w * 0.3,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: h * 0.03),

                      // Booking Info
                      Container(
                        padding: EdgeInsets.all(w * 0.04),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundGrey,
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                        ),
                        child: Column(
                          children: [
                            _buildInfoRow(
                              context,
                              'Mobil',
                              booking['carName'],
                            ),
                            Divider(height: h * 0.03),
                            _buildInfoRow(
                              context,
                              'Durasi',
                              booking['duration'],
                            ),
                            Divider(height: h * 0.03),
                            _buildInfoRow(
                              context,
                              'Lokasi',
                              booking['location'],
                            ),
                            Divider(height: h * 0.03),
                            _buildInfoRow(
                              context,
                              'Booking ID',
                              '#${booking['id'].toString().substring(0, 8)}',
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    final h = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: h * 0.015,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: h * 0.015,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
        ),
      ],
    );
  }
}
