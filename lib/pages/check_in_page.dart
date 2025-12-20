import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class CheckInPage extends StatelessWidget {
  final Map<String, dynamic> booking;

  const CheckInPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge,
                vertical: MediaQuery.of(context).size.height * 0.015,
              ),
              child: SizedBox(
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
                        'Check In',
                        style: AppTextStyles.titleBlack(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(width: MediaQuery.of(context).size.width * 0.12),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            // QR Code Section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge),
                  child: Column(
                    children: [
                      // Info Card
                      Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundGrey,
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Scan QR Code untuk Check In',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.018,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textBlack,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                            Text(
                              'Tunjukkan QR Code ini ke petugas untuk melakukan check in',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.014,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                      // QR Code
                      Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
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
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.width * 0.6,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.width * 0.6,
                            color: Colors.grey[200],
                            child: Icon(
                              Icons.qr_code,
                              size: MediaQuery.of(context).size.width * 0.3,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                      // Booking Info
                      Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
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
                            Divider(height: MediaQuery.of(context).size.height * 0.03),
                            _buildInfoRow(
                              context,
                              'Durasi',
                              booking['duration'],
                            ),
                            Divider(height: MediaQuery.of(context).size.height * 0.03),
                            _buildInfoRow(
                              context,
                              'Lokasi',
                              booking['location'],
                            ),
                            Divider(height: MediaQuery.of(context).size.height * 0.03),
                            _buildInfoRow(
                              context,
                              'Booking ID',
                              '#${booking['id'].toString().substring(0, 8)}',
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.015,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.015,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
        ),
      ],
    );
  }
}
