import 'package:flutter/material.dart';
import 'package:rent_app/pages/login_page.dart';
import 'package:rent_app/pages/main_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section with padding
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
                vertical: MediaQuery.of(context).size.height * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      'Apakah kamu ingin mobil untuk liburan?',
                      style: AppTextStyles.header(context),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall),

                  // Subtitle
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      'Mobil seperti apa yang cocok kamu bawa untuk liburan bersama keluarga?',
                      style: AppTextStyles.bodyMedium(context),
                    ),
                  ),
                ],
              ),
            ),

            // Image Section - Full width without padding
            Expanded(
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/onboarding.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            // Buttons Section with padding
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
                vertical: MediaQuery.of(context).size.height * 0.04,
              ),
              child: Column(
                children: [
                  // Mulai Button
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.gradientStart1,
                            AppColors.gradientEnd1,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.018),
                            child: Center(
                              child: Text(
                                'Mulai',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),

                  // Skip Button
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundWhite,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primaryBlue,
                          width: 2,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.018),
                            child: Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
