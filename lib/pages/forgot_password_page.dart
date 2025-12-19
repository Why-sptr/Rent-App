import 'package:flutter/material.dart';
import 'package:rent_app/pages/otp_verification_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSendOTP() {
    if (_formKey.currentState!.validate()) {
      // Navigate to OTP verification page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationPage(email: _emailController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.loginGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Bar
              Padding(
                padding: const EdgeInsets.all(AppConstants.paddingMedium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.textWhite),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Image.asset(
                      'assets/images/logo_rentku.png',
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              // Title Section
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08,
                  vertical: MediaQuery.of(context).size.height * 0.02,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lupa Kata Sandi?',
                        style: AppTextStyles.header(context).copyWith(
                          color: AppColors.textWhite,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        'Masukkan email untuk verifikasi',
                        style: AppTextStyles.bodyMedium(context).copyWith(
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // White Card
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppConstants.borderRadiusCurved),
                      topRight: Radius.circular(AppConstants.borderRadiusCurved),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.08,
                          vertical: MediaQuery.of(context).size.height * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            
                            // Email Field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: AppTextStyles.label(context),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall / 2),
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email tidak boleh kosong';
                                    }
                                    if (!value.contains('@')) {
                                      return 'Email tidak valid';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'email@gmail.com',
                                    hintStyle: AppTextStyles.hint(context),
                                    filled: true,
                                    fillColor: AppColors.backgroundLightGrey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                      borderSide: const BorderSide(
                                        color: AppColors.borderRed,
                                        width: AppConstants.containerBorderWidth,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                      borderSide: const BorderSide(
                                        color: AppColors.borderRed,
                                        width: AppConstants.buttonBorderWidth,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: AppConstants.paddingLarge,
                                      vertical: MediaQuery.of(context).size.height * 0.018,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                            // Send OTP Button
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: AppColors.buttonGradient,
                                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                ),
                                child: ElevatedButton(
                                  onPressed: _handleSendOTP,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                      vertical: MediaQuery.of(context).size.height * 0.016,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                    ),
                                  ),
                                  child: Text(
                                    'Kirim OTP',
                                    style: AppTextStyles.button(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
