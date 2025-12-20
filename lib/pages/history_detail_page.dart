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
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
              vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button - Navigate to history
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
                        'Detail Pesanan',
                        style: AppTextStyles.titleBlack(context),
                      ),
                      // Empty space for alignment
                      SizedBox(width: MediaQuery.of(context).size.width * 0.13),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                // Car info tile
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
                          booking['carImage'],
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.directions_car,
                            size: MediaQuery.of(context).size.height * 0.06,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            booking['carName'],
                            style: AppTextStyles.titleBlack(context),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall),
                          Text(
                            '${booking['transmission']}, ${booking['maxSpeed']} KM/J, ${booking['capacity']} Orang',
                            style: AppTextStyles.bodySmall(context).copyWith(
                              color: AppColors.iconGrey,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall,
                              vertical: MediaQuery.of(context).size.height * AppConstants.spacingXSmall,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                            ),
                            child: Text(
                              'SUV',
                              style: AppTextStyles.buttonSmall(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                // Spec Cards
                Row(
                  children: [
                    SpecCard(
                      icon: Icons.settings_outlined,
                      label: 'Transmisi',
                      value: booking['transmission'],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                    SpecCard(
                      icon: Icons.speed,
                      label: 'Maks. Kecepatan',
                      value: '${booking['maxSpeed']} KM/J',
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                    SpecCard(
                      icon: Icons.airline_seat_recline_normal,
                      label: 'Kapasitas',
                      value: '${booking['capacity']} Orang',
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                // Detail Pesanan card
                _shadowCard(
                  context,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail Pesanan',
                          style: AppTextStyles.titleBlack(context),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Durasi Sewa',
                                    style: AppTextStyles.bodyLarge(context).copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall),
                                  Text(
                                    booking['duration'],
                                    style: AppTextStyles.bodySmall(context).copyWith(
                                      color: AppColors.iconGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lokasi Penjemputan',
                                    style: AppTextStyles.bodyLarge(context).copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall),
                                  Text(
                                    booking['location'],
                                    style: AppTextStyles.bodySmall(context).copyWith(
                                      color: AppColors.iconGrey,
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

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                // Rincian Pembayaran card
                _shadowCard(
                  context,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rincian Pembayaran',
                          style: AppTextStyles.titleBlack(context),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                booking['priceDetail'],
                                style: AppTextStyles.bodySmall(context).copyWith(
                                  color: AppColors.iconGrey,
                                ),
                              ),
                            ),
                            Text(
                              _formatPrice(booking['subtotal']),
                              style: AppTextStyles.bodyLarge(context).copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Admin',
                                style: AppTextStyles.bodySmall(context).copyWith(
                                  color: AppColors.iconGrey,
                                ),
                              ),
                            ),
                            Text(
                              'Rp. 2.500',
                              style: AppTextStyles.bodySmall(context).copyWith(
                                color: AppColors.iconGrey,
                              ),
                            ),
                          ],
                        ),
                        Divider(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge, thickness: 1),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Total',
                                style: AppTextStyles.bodyLarge(context).copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              _formatPrice(booking['total']),
                              style: AppTextStyles.bodyLarge(context).copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                        Divider(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall, thickness: 1),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Metode Pembayaran',
                                style: AppTextStyles.bodyLarge(context).copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              booking['paymentMethod'],
                              style: AppTextStyles.bodyLarge(context).copyWith(
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

                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

                // Buttons Row
                Row(
                  children: [
                    // Cancel button
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundWhite,
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
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
                                      color: AppColors.iconGrey,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'Tidak',
                                        style: AppTextStyles.bodyMedium(context).copyWith(
                                          color: AppColors.iconGrey,
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
                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                              child: Center(
                                child: Text(
                                  'Batalkan',
                                  style: AppTextStyles.button(context).copyWith(
                                    color: AppColors.primaryBlue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
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
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 2,
                          ),
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
                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                              child: Center(
                                child: Text(
                                  'Check In',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
