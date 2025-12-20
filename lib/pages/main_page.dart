import 'package:flutter/material.dart';
import 'package:rent_app/pages/dashboard_page.dart';
import 'package:rent_app/pages/profile_page.dart';
import 'package:rent_app/pages/search_product_page.dart';
import 'package:rent_app/pages/history_page.dart';
import 'package:rent_app/config/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _navigateToDashboard() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void _navigateToSearch() {
    setState(() {
      _currentIndex = 1;
    });
  }

  void _navigateToProfile() {
    setState(() {
      _currentIndex = 3;
    });
  }

  List<Widget> get _pages => [
    DashboardPage(
      onNavigateToSearch: _navigateToSearch,
      onNavigateToProfile: _navigateToProfile,
    ),
    const SearchProductPage(isEmbedded: true),
    const HistoryPage(isEmbedded: true),
    ProfilePage(onBackToDashboard: _navigateToDashboard),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.backgroundWhite,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: Colors.grey[400],
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 0 ? Icons.home : Icons.home_outlined,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 1 ? Icons.search : Icons.search_outlined,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 2 ? Icons.history : Icons.history_outlined,
              ),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 3 ? Icons.person : Icons.person_outline,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
