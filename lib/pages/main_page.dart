import 'package:flutter/material.dart';
import 'package:rent_app/pages/dashboard_page.dart';
import 'package:rent_app/pages/profile_page.dart';
import 'package:rent_app/pages/search_product_page.dart';
import 'package:rent_app/pages/history_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';

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
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.012,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusCurved),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.dashboard,
              index: 0,
            ),
            _buildNavItem(
              icon: Icons.search,
              index: 1,
            ),
            _buildNavItem(
              icon: Icons.history,
              index: 2,
            ),
            _buildNavItem(
              icon: Icons.bolt,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    
    // Labels untuk setiap menu
    final labels = ['Beranda', 'Search', 'Riwayat', 'Profile'];
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected 
              ? MediaQuery.of(context).size.width * 0.04 
              : MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.012,
        ),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.primaryBlue 
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.textWhite : AppColors.iconGrey,
              size: MediaQuery.of(context).size.height * 0.026,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isSelected
                  ? Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                        Text(
                          labels[index],
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: MediaQuery.of(context).size.height * 0.014,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
