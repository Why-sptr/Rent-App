import 'package:flutter/material.dart';
import 'package:rent_app/pages/login_page.dart';
import 'package:rent_app/pages/edit_profile_page.dart';
import 'package:rent_app/pages/faq_page.dart';
import 'package:rent_app/pages/about_app_page.dart';
import 'package:rent_app/pages/notification_page.dart';
import 'package:rent_app/pages/favorite_page.dart';
import 'package:rent_app/pages/history_page.dart';
import 'package:rent_app/pages/forgot_password_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback onBackToDashboard;

  const ProfilePage({super.key, required this.onBackToDashboard});

  @override
  Widget build(BuildContext context) {
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
                    MediaQuery.of(context).size.width *
                        AppConstants.widthPaddingLarge,
                    MediaQuery.of(context).size.height *
                        AppConstants.spacingLarge,
                    MediaQuery.of(context).size.width *
                        AppConstants.widthPaddingLarge,
                    MediaQuery.of(context).size.height *
                        AppConstants.spacingXLarge,
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
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width *
                                    AppConstants.widthPaddingSmall,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.borderGrey.withOpacity(0.3),
                                  width: AppConstants.containerBorderWidth,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadiusMedium,
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.textWhite,
                                size:
                                    MediaQuery.of(context).size.height *
                                    AppConstants.iconSizeMedium,
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
                                  builder: (context) =>
                                      const NotificationPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width *
                                    AppConstants.widthPaddingSmall,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.borderGrey.withOpacity(0.3),
                                  width: AppConstants.containerBorderWidth,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadiusMedium,
                                ),
                              ),
                              child: Icon(
                                Icons.notifications_outlined,
                                color: AppColors.textWhite,
                                size:
                                    MediaQuery.of(context).size.height *
                                    AppConstants.iconSizeMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height *
                            AppConstants.spacingLarge,
                      ),

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
                          radius:
                              MediaQuery.of(context).size.width *
                              AppConstants.heightAvatarRadius,
                          backgroundColor: Colors.grey[300],
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/avatar.jpg',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.width * 0.28,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.person,
                                  size:
                                      MediaQuery.of(context).size.width * 0.15,
                                  color: Colors.grey[600],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height *
                            AppConstants.spacingMedium,
                      ),

                      // Nama
                      Text(
                        'Wahyu Cahyo Saputra',
                        style: AppTextStyles.title(context),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height *
                            AppConstants.spacingXSmall /
                            2,
                      ),

                      // NIM
                      Text(
                        '20 Tahun, Semarang',
                        style: AppTextStyles.subtitleWhite(context),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height *
                            AppConstants.spacingXLarge,
                      ),

                      // (Prodi - Semester)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width *
                              AppConstants.widthPaddingLarge,
                          vertical:
                              MediaQuery.of(context).size.height *
                              AppConstants.paddingSmall /
                              1000,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.textWhite.withValues(
                            alpha: AppConstants.alphaButton,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppConstants.borderRadiusXLarge,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.card_membership_outlined,
                              color: AppColors.textWhite,
                              size:
                                  MediaQuery.of(context).size.height *
                                  AppConstants.spacingLarge,
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width *
                                  AppConstants.spacingMedium,
                            ),
                            Text(
                              'Platinum Membership',
                              style: AppTextStyles.labelMedium(context),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width *
                                  AppConstants.widthPaddingSmall,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height *
                            AppConstants.spacingXLarge,
                      ),
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
              transform: Matrix4.translationValues(
                0,
                -AppConstants.curveLift,
                0,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width *
                      AppConstants.widthPaddingLarge,
                  vertical:
                      MediaQuery.of(context).size.height *
                      AppConstants.spacingXLarge,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          AppConstants.spacingSmall,
                    ),

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
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width *
                                    AppConstants.widthPaddingMedium,
                              ),
                              decoration: BoxDecoration(
                                gradient: AppColors.buttonGradient,
                                borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadiusLarge,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.directions_car,
                                    color: AppColors.textWhite,
                                    size:
                                        MediaQuery.of(context).size.height *
                                        AppConstants.iconSizeLarge,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        AppConstants.spacingSmall,
                                  ),
                                  Text(
                                    '12',
                                    style: AppTextStyles.titleMedium(context),
                                  ),
                                  Text(
                                    'Mobil Disewa',
                                    style: TextStyle(
                                      color: AppColors.textWhite.withValues(
                                        alpha: AppConstants.alphaHigh,
                                      ),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                          AppConstants.fontSizeXSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width *
                              AppConstants.widthPaddingMedium,
                        ),
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
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width *
                                    AppConstants.widthPaddingMedium,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundGrey,
                                borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadiusLarge,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: AppColors.iconPrimary,
                                    size:
                                        MediaQuery.of(context).size.height *
                                        AppConstants.iconSizeLarge,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        AppConstants.spacingSmall,
                                  ),
                                  Text(
                                    '8',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                          AppConstants.fontSizeXLarge,
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

                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          AppConstants.spacingXLarge,
                    ),

                    // Menu List
                    Text(
                      'Pengaturan Akun',
                      style: AppTextStyles.titleBlack(context).copyWith(
                        fontSize:
                            MediaQuery.of(context).size.height *
                            AppConstants.spacingLarge,
                      ),
                    ),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          AppConstants.spacingMedium,
                    ),

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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ForgotPasswordPage(isFromProfile: true),
                          ),
                        );
                      },
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

                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          AppConstants.spacingLarge,
                    ),

                    Text(
                      'Lainnya',
                      style: AppTextStyles.titleBlack(context).copyWith(
                        fontSize:
                            MediaQuery.of(context).size.height *
                            AppConstants.spacingLarge,
                      ),
                    ),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          AppConstants.spacingMedium,
                    ),

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

                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          AppConstants.spacingXLarge,
                    ),

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
                          style: AppTextStyles.button(
                            context,
                          ).copyWith(color: AppColors.redAccent),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.016,
                          ),
                          side: const BorderSide(
                            color: AppColors.redAccent,
                            width: AppConstants.buttonBorderWidth,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppConstants.borderRadiusMedium,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height * 0.05,
                    ),
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
    return Container(
      margin: EdgeInsets.only(
        bottom:
            MediaQuery.of(context).size.height *
            AppConstants.paddingSmall /
            1000,
      ),
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
            size:
                MediaQuery.of(context).size.height *
                AppConstants.iconSizeMedium,
          ),
        ),
        title: Text(title, style: AppTextStyles.bodyLarge(context)),
        subtitle: Text(subtitle, style: AppTextStyles.subtitle(context)),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          ),
          title: Text('Keluar', style: AppTextStyles.titleBlack(context)),
          content: Text(
            'Apakah Anda yakin ingin keluar dari aplikasi?',
            style: AppTextStyles.bodyLarge(
              context,
            ).copyWith(color: Colors.grey[700]),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Batal',
                style: AppTextStyles.bodyMedium(
                  context,
                ).copyWith(color: Colors.grey[600]),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.buttonGradient,
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadiusSmall,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
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
