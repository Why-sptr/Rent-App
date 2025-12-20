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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final filteredNotifications = getFilteredNotifications();

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.015,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.028),
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
                        size: screenHeight * 0.022,
                      ),
                    ),
                  ),
                  Text(
                    'Notifikasi',
                    style: TextStyle(
                      fontSize: screenHeight * 0.027,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.028),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.tune,
                      color: AppColors.textBlack,
                      size: screenHeight * 0.022,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            // Tabs
            Row(
              children: [
                // Semua Tab
                GestureDetector(
                  onTap: () => setState(() => selectedTab = 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenHeight * 0.012,
                    ),
                    decoration: BoxDecoration(
                      color: selectedTab == 0 ? AppColors.primaryBlue : AppColors.backgroundLightGrey,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                    ),
                    child: Text(
                      'Semua',
                      style: TextStyle(
                        fontSize: screenHeight * 0.0165,
                        fontWeight: FontWeight.w600,
                        color: selectedTab == 0 ? AppColors.textWhite : AppColors.textBlack,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.025),

                // Order Tab
                GestureDetector(
                  onTap: () => setState(() => selectedTab = 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenHeight * 0.012,
                    ),
                    decoration: BoxDecoration(
                      color: selectedTab == 1 ? AppColors.primaryBlue : AppColors.backgroundLightGrey,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                    ),
                    child: Text(
                      'Order',
                      style: TextStyle(
                        fontSize: screenHeight * 0.0165,
                        fontWeight: FontWeight.w600,
                        color: selectedTab == 1 ? AppColors.textWhite : AppColors.textBlack,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.025),

                // Aplikasi Tab
                GestureDetector(
                  onTap: () => setState(() => selectedTab = 2),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenHeight * 0.012,
                    ),
                    decoration: BoxDecoration(
                      color: selectedTab == 2 ? AppColors.primaryBlue : AppColors.backgroundLightGrey,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                    ),
                    child: Text(
                      'Aplikasi',
                      style: TextStyle(
                        fontSize: screenHeight * 0.0165,
                        fontWeight: FontWeight.w600,
                        color: selectedTab == 2 ? AppColors.textWhite : AppColors.textBlack,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.025),

            // Terbaru Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Terbaru',
                  style: TextStyle(
                    fontSize: screenHeight * 0.0195,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBlack,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Action untuk baca semua
                  },
                  child: Text(
                    'Baca Semua',
                    style: TextStyle(
                      fontSize: screenHeight * 0.0155,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.015),

            // Notification Items
            ...List.generate(filteredNotifications.length, (index) {
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
                      padding: EdgeInsets.only(bottom: screenHeight * 0.015),
                      child: Text(
                        notification['date']!,
                        style: TextStyle(
                          fontSize: screenHeight * 0.0165,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ),

                  // Notification Item
                  Container(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                    padding: EdgeInsets.all(screenWidth * 0.04),
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
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: AppColors.primaryBlue,
                            size: screenHeight * 0.026,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),

                        // Content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification['title']!,
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0175,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlack,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                notification['description']!,
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0155,
                                  color: Colors.grey[600],
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

            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}
