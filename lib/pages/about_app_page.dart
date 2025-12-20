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
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.015,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.028),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.textBlack,
                        size: MediaQuery.of(context).size.height * 0.022,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Info Aplikasi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.027,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.11),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.025),

            // Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section 1 - Tentang Aplikasi RentKu
                  Text(
                    'Tentang Aplikasi RentKu',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Text(
                    'RentKu adalah aplikasi rental mobil berbasis digital yang dirancang untuk memudahkan pengguna dalam mencari dan memesan kendaraan secara cepat, aman, dan praktis melalui smartphone. Aplikasi ini menghadirkan solusi modern bagi kebutuhan transportasi harian, perjalanan bisnis, maupun wisata.',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.0165,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),

                  // Section 2 - Fitur dan Kemudahan
                  Text(
                    'Fitur dan Kemudahan',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Text(
                    'Melalui RentKu, pengguna dapat memilih berbagai jenis mobil sesuai kebutuhan dengan informasi yang jelas, mulai dari harga sewa, spesifikasi kendaraan, hingga durasi pemakaian. Sistem pemesanan online memungkinkan proses booking dilakukan kapan saja tanpa harus datang langsung ke tempat rental.',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.0165,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),

                  // Section 3 - Kemudahan Bagi Pemilik
                  Text(
                    'Kemudahan Bagi Pemilik Usaha',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Text(
                    'Selain untuk pelanggan, RentKu juga memberikan kemudahan bagi pemilik usaha rental mobil dalam mengelola armada, jadwal sewa, dan data transaksi secara terpusat. Hal ini membantu meningkatkan efisiensi operasional dan memperluas jangkauan pelanggan.',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.0165,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),

                  // Section 4 - Kesimpulan
                  Text(
                    'Pengalaman Terbaik',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Text(
                    'Dengan tampilan yang sederhana dan sistem yang terintegrasi, RentKu menghadirkan pengalaman sewa mobil yang lebih nyaman, transparan, dan terpercaya bagi semua pihak.',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.0165,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  // App Version Info
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06,
                        vertical: MediaQuery.of(context).size.height * 0.015,
                      ),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'RentKu',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.022,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textWhite,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                          Text(
                            'Versi 1.0.0',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.016,
                              color: AppColors.textWhite.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
