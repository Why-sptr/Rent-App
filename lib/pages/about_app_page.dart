import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
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
                        border: Border.all(
                          color: AppColors.borderGrey,
                          width: AppConstants.containerBorderWidth,
                        ),
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.textBlack,
                        size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                      ),
                    ),
                  ),
                  Text(
                    'Info Aplikasi',
                    style: AppTextStyles.titleBlack(context),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.11),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

            // Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section 1 - Tentang Aplikasi RentKu
                  Text(
                    'Tentang Aplikasi RentKu',
                    style: AppTextStyles.titleBlack(context),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                  Text(
                    'RentKu adalah aplikasi rental mobil berbasis digital yang dirancang untuk memudahkan pengguna dalam mencari dan memesan kendaraan secara cepat, aman, dan praktis melalui smartphone. Aplikasi ini menghadirkan solusi modern bagi kebutuhan transportasi harian, perjalanan bisnis, maupun wisata.',
                    style: AppTextStyles.bodyMedium(context).copyWith(
                      color: AppColors.iconGrey,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

                  // Section 2 - Fitur dan Kemudahan
                  Text(
                    'Fitur dan Kemudahan',
                    style: AppTextStyles.titleBlack(context),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                  Text(
                    'Melalui RentKu, pengguna dapat memilih berbagai jenis mobil sesuai kebutuhan dengan informasi yang jelas, mulai dari harga sewa, spesifikasi kendaraan, hingga durasi pemakaian. Sistem pemesanan online memungkinkan proses booking dilakukan kapan saja tanpa harus datang langsung ke tempat rental.',
                    style: AppTextStyles.bodyMedium(context).copyWith(
                      color: AppColors.iconGrey,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

                  // Section 3 - Kemudahan Bagi Pemilik
                  Text(
                    'Kemudahan Bagi Pemilik Usaha',
                    style: AppTextStyles.titleBlack(context),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                  Text(
                    'Selain untuk pelanggan, RentKu juga memberikan kemudahan bagi pemilik usaha rental mobil dalam mengelola armada, jadwal sewa, dan data transaksi secara terpusat. Hal ini membantu meningkatkan efisiensi operasional dan memperluas jangkauan pelanggan.',
                    style: AppTextStyles.bodyMedium(context).copyWith(
                      color: AppColors.iconGrey,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

                  // Section 4 - Kesimpulan
                  Text(
                    'Pengalaman Terbaik',
                    style: AppTextStyles.titleBlack(context),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                  Text(
                    'Dengan tampilan yang sederhana dan sistem yang terintegrasi, RentKu menghadirkan pengalaman sewa mobil yang lebih nyaman, transparan, dan terpercaya bagi semua pihak.',
                    style: AppTextStyles.bodyMedium(context).copyWith(
                      color: AppColors.iconGrey,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge * 2),

                  // App Version Info
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06,
                        vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                      ),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'RentKu',
                            style: AppTextStyles.titleLarge(context).copyWith(
                              color: AppColors.textWhite,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall),
                          Text(
                            'Versi 1.0.0',
                            style: AppTextStyles.bodyMedium(context).copyWith(
                              color: AppColors.textWhite.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
