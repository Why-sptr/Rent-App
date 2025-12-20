import 'package:flutter/material.dart';
import 'package:rent_app/pages/login_page.dart';
import 'package:rent_app/pages/edit_profile_page.dart';
import 'package:rent_app/pages/faq_page.dart';
import 'package:rent_app/pages/about_app_page.dart';
import 'package:rent_app/pages/notification_page.dart';
import 'package:rent_app/pages/favorite_page.dart';
import 'package:rent_app/pages/history_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback onBackToDashboard;
  
  const ProfilePage({
    super.key,
    required this.onBackToDashboard,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with gradient
            Container(
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenWidth * AppConstants.widthPaddingLarge,
                    screenHeight * AppConstants.spacingLarge,
                    screenWidth * AppConstants.widthPaddingLarge,
                    screenHeight * AppConstants.spacingXLarge,
                  ),
                  child: Column(
                    children: [
                      // App Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: onBackToDashboard,
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * 0.028),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.textWhite.withOpacity(0.3),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.textWhite,
                                size: screenHeight * 0.022,
                              ),
                            ),
                          ),
                          Text(
                            'Profile',
                            style: AppTextStyles.titleMedium(context),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditProfilePage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * 0.028),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.textWhite.withOpacity(0.3),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.edit_outlined,
                                color: AppColors.textWhite,
                                size: screenHeight * 0.022,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * AppConstants.spacingLarge),
                      
                      // Avatar / Foto Profile
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.textWhite,
                            width: 3.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: screenWidth * AppConstants.heightAvatarRadius,
                          backgroundColor: Colors.grey[300],
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/avatar.jpg',
                              fit: BoxFit.cover,
                              width: screenWidth * 0.28,
                              height: screenWidth * 0.28,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.person,
                                  size: screenWidth * 0.15,
                                  color: Colors.grey[600],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * AppConstants.spacingMedium),
                      
                      // Nama
                      Text(
                        'Wahyu Cahyo Saputra',
                        style: AppTextStyles.title(context),
                      ),
                      SizedBox(height: screenHeight * AppConstants.spacingXSmall / 2),
                      
                      // NIM
                      Text(
                        '20 Tahun, Semarang',
                        style: AppTextStyles.subtitleWhite(context),
                      ),
                      SizedBox(height: screenHeight * AppConstants.spacingXLarge),
                      
                      // (Prodi - Semester)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * AppConstants.widthPaddingLarge,
                          vertical: screenHeight * AppConstants.paddingSmall / 1000,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.textWhite.withValues(alpha: AppConstants.alphaButton),
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.card_membership_outlined,
                              color: AppColors.textWhite,
                              size: screenHeight * AppConstants.spacingLarge,
                            ),
                            SizedBox(width: screenWidth * AppConstants.spacingMedium),
                            Text(
                              'Platinum Membership',
                              style: AppTextStyles.labelMedium(context),
                            ),
                            SizedBox(width: screenWidth * AppConstants.widthPaddingSmall),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * AppConstants.spacingXLarge),
                    ],
                  ),
                ),
              ),
            ),
            
            // Content Section
            Container(
              decoration: const BoxDecoration(
                color: AppColors.backgroundWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.borderRadiusCurved),
                  topRight: Radius.circular(AppConstants.borderRadiusCurved),
                ),
              ),
              transform: Matrix4.translationValues(0, -AppConstants.curveLift, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * AppConstants.widthPaddingLarge,
                  vertical: screenHeight * AppConstants.spacingXLarge,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * AppConstants.spacingSmall),
                    
                    // Statistics Cards
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HistoryPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * AppConstants.widthPaddingMedium),
                              decoration: BoxDecoration(
                                gradient: AppColors.buttonGradient,
                                borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.directions_car,
                                    color: AppColors.textWhite,
                                    size: screenHeight * AppConstants.iconSizeLarge,
                                  ),
                                  SizedBox(height: screenHeight * AppConstants.spacingSmall),
                                  Text(
                                    '12',
                                    style: AppTextStyles.titleMedium(context),
                                  ),
                                  Text(
                                    'Mobil Disewa',
                                    style: TextStyle(
                                      color: AppColors.textWhite.withValues(alpha: AppConstants.alphaHigh),
                                      fontSize: screenHeight * AppConstants.fontSizeXSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * AppConstants.widthPaddingMedium),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FavoritePage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * AppConstants.widthPaddingMedium),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundGrey,
                                borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: AppColors.iconPrimary,
                                    size: screenHeight * AppConstants.iconSizeLarge,
                                  ),
                                  SizedBox(height: screenHeight * AppConstants.spacingSmall),
                                  Text(
                                    '8',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: screenHeight * AppConstants.fontSizeXLarge,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Favorit',
                                    style: AppTextStyles.subtitle(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: screenHeight * AppConstants.spacingXLarge),
                    
                    // Menu List
                    Text(
                      'Pengaturan Akun',
                      style: AppTextStyles.titleBlack(context).copyWith(
                        fontSize: screenHeight * AppConstants.spacingLarge,
                      ),
                    ),
                    SizedBox(height: screenHeight * AppConstants.spacingMedium),
                    
                    _buildMenuItem(
                      context,
                      icon: Icons.person_outline,
                      title: 'Edit Profile',
                      subtitle: 'Ubah informasi pribadi Anda',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfilePage(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.lock_outline,
                      title: 'Ubah Password',
                      subtitle: 'Perbarui kata sandi Anda',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.notifications_outlined,
                      title: 'Notifikasi',
                      subtitle: 'Atur preferensi notifikasi',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ),
                        );
                      },
                    ),
                    
                    SizedBox(height: screenHeight * AppConstants.spacingLarge),
                    
                    Text(
                      'Lainnya',
                      style: AppTextStyles.titleBlack(context).copyWith(
                        fontSize: screenHeight * AppConstants.spacingLarge,
                      ),
                    ),
                    SizedBox(height: screenHeight * AppConstants.spacingMedium),
                    
                    _buildMenuItem(
                      context,
                      icon: Icons.history,
                      title: 'Riwayat Transaksi',
                      subtitle: 'Lihat semua transaksi Anda',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryPage(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.help_outline,
                      title: 'Bantuan & Dukungan',
                      subtitle: 'FAQ dan layanan bantuan',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FaqPage(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.info_outline,
                      title: 'Tentang Aplikasi',
                      subtitle: 'Versi 1.0.0',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutAppPage(),
                          ),
                        );
                      },
                    ),
                    
                    SizedBox(height: screenHeight * AppConstants.spacingXLarge),
                    
                    // Logout
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _showLogoutDialog(context);
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: AppColors.redAccent,
                        ),
                        label: Text(
                          'Keluar',
                          style: AppTextStyles.button(context).copyWith(
                            color: AppColors.redAccent,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.016,
                          ),
                          side: const BorderSide(
                            color: AppColors.redAccent,
                            width: AppConstants.buttonBorderWidth,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: screenHeight * AppConstants.spacingLarge),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * AppConstants.paddingSmall / 1000),
      decoration: BoxDecoration(
        color: AppColors.backgroundGrey,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppColors.iconPrimary,
            size: screenHeight * AppConstants.iconSizeMedium,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.bodyLarge(context),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.subtitle(context),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey[400],
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          ),
          title: Text(
            'Keluar',
            style: AppTextStyles.titleBlack(context),
          ),
          content: Text(
            'Apakah Anda yakin ingin keluar dari aplikasi?',
            style: AppTextStyles.bodyLarge(context).copyWith(
              color: Colors.grey[700],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Batal',
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
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false,
                  );
                },
                child: Text(
                  'Keluar',
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
