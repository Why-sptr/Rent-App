import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int selectedTab = 0; // 0: Semua, 1: Order, 2: Aplikasi

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Pembayaran Berhasil',
      'description': 'Berhasil melakukan pembayaran',
      'date': '28 Desember 2025',
      'type': 'semua',
      'isRead': false,
    },
    {
      'title': 'Order berhasil dibuat',
      'description': 'Order kamu berhasil dibuat',
      'date': '28 Desember 2025',
      'type': 'order',
      'isRead': false,
    },
    {
      'title': 'Checkout Berhasil',
      'description': 'Yey kamu sudah selesai checkout',
      'date': '28 Desember 2025',
      'type': 'semua',
      'isRead': false,
    },
    {
      'title': 'Checkin Berhasil',
      'description': 'Yey kamu sudah selesai checkin',
      'date': '28 Desember 2025',
      'type': 'aplikasi',
      'isRead': false,
    },
    {
      'title': 'Promo Akhir Tahun',
      'description': 'Dapatkan diskon hingga 50% untuk semua mobil',
      'date': '27 Desember 2025',
      'type': 'aplikasi',
      'isRead': true,
    },
    {
      'title': 'Update Aplikasi Tersedia',
      'description': 'Versi terbaru aplikasi sudah tersedia di toko',
      'date': '27 Desember 2025',
      'type': 'aplikasi',
      'isRead': true,
    },
    {
      'title': 'Pengembalian Mobil Sukses',
      'description': 'Terima kasih telah menyewa mobil kami',
      'date': '27 Desember 2025',
      'type': 'order',
      'isRead': true,
    },
    {
      'title': 'Bonus Point Diterima',
      'description': 'Anda mendapatkan 500 poin reward',
      'date': '27 Desember 2025',
      'type': 'semua',
      'isRead': true,
    },
  ];

  List<Map<String, dynamic>> getFilteredNotifications() {
    if (selectedTab == 0) {
      return notifications;
    } else if (selectedTab == 1) {
      return notifications.where((n) => n['type'] == 'order').toList();
    } else {
      return notifications.where((n) => n['type'] == 'aplikasi').toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredNotifications = getFilteredNotifications();

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
                    'Notifikasi',
                    style: AppTextStyles.titleBlack(context),
                  ),
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderGrey,
                        width: AppConstants.containerBorderWidth,
                      ),
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                    ),
                    child: Icon(
                      Icons.tune,
                      color: AppColors.textBlack,
                      size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

            // Tabs
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
              child: Row(
                children: [
                // Semua Tab
                GestureDetector(
                  onTap: () => setState(() => selectedTab = 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: MediaQuery.of(context).size.height * AppConstants.spacingSmall,
                    ),
                    decoration: BoxDecoration(
                      color: selectedTab == 0 ? AppColors.primaryBlue : AppColors.backgroundLightGrey,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                    ),
                    child: Text(
                      'Semua',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: selectedTab == 0 ? AppColors.textWhite : AppColors.textBlack,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.025),

                // Order Tab
                GestureDetector(
                  onTap: () => setState(() => selectedTab = 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: MediaQuery.of(context).size.height * AppConstants.spacingSmall,
                    ),
                    decoration: BoxDecoration(
                      color: selectedTab == 1 ? AppColors.primaryBlue : AppColors.backgroundLightGrey,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                    ),
                    child: Text(
                      'Order',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: selectedTab == 1 ? AppColors.textWhite : AppColors.textBlack,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.025),

                // Aplikasi Tab
                GestureDetector(
                  onTap: () => setState(() => selectedTab = 2),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: MediaQuery.of(context).size.height * AppConstants.spacingSmall,
                    ),
                    decoration: BoxDecoration(
                      color: selectedTab == 2 ? AppColors.primaryBlue : AppColors.backgroundLightGrey,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                    ),
                    child: Text(
                      'Aplikasi',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: selectedTab == 2 ? AppColors.textWhite : AppColors.textBlack,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

            // Terbaru Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Terbaru',
                    style: AppTextStyles.bodyLarge(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action untuk baca semua
                    },
                    child: Text(
                      'Baca Semua',
                      style: AppTextStyles.bodySmall(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),

            // Notification Items
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(filteredNotifications.length, (index) {
                  final notification = filteredNotifications[index];
                  final showDateDivider = index == 0 ||
                      filteredNotifications[index]['date'] !=
                          filteredNotifications[index - 1]['date'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date Divider
                      if (showDateDivider)
                        Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                          child: Text(
                            notification['date']!,
                            style: AppTextStyles.bodyMedium(context).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      // Notification Item
                      Container(
                        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                    decoration: BoxDecoration(
                      color: notification['isRead'] == true
                          ? AppColors.backgroundWhite
                          : AppColors.backgroundLightGrey,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1A000000),
                          blurRadius: 12,
                          spreadRadius: 0,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bell Icon
                        Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: AppColors.primaryBlue,
                            size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),

                        // Content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification['title']!,
                                style: AppTextStyles.bodyMedium(context).copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall / 2),
                              Text(
                                notification['description']!,
                                style: AppTextStyles.bodySmall(context).copyWith(
                                  color: AppColors.iconGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),
          ],
        ),
      ),
    );
  }
}

