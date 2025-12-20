import 'package:flutter/material.dart';
import 'package:rent_app/pages/success_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleChangePassword() {
    if (_formKey.currentState!.validate()) {
      // Navigate to success page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessPage()),
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
                        'Kata Sandi Baru',
                        style: AppTextStyles.header(context).copyWith(
                          color: AppColors.textWhite,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        'Silahkan buat kata sandi baru untuk masuk ke akun kamu',
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
                            
                            // Password Baru Field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password Baru',
                                  style: AppTextStyles.label(context),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall / 2),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: !_isPasswordVisible,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.0165,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password tidak boleh kosong';
                                    }
                                    if (value.length < 6) {
                                      return 'Password minimal 6 karakter';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: '••••••••••••',
                                    hintStyle: AppTextStyles.hint(context).copyWith(
                                      fontSize: MediaQuery.of(context).size.height * 0.0155,
                                    ),
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
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: AppColors.textSecondary,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible = !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.018),

                            // Konfirmasi Password Field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Konfirmasi Password',
                                  style: AppTextStyles.label(context),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall / 2),
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: !_isConfirmPasswordVisible,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.0165,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Konfirmasi password tidak boleh kosong';
                                    }
                                    if (value != _passwordController.text) {
                                      return 'Password tidak cocok';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: '••••••••••••',
                                    hintStyle: AppTextStyles.hint(context).copyWith(
                                      fontSize: MediaQuery.of(context).size.height * 0.0155,
                                    ),
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
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isConfirmPasswordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: AppColors.textSecondary,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                            // Change Password Button
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: AppColors.buttonGradient,
                                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                ),
                                child: ElevatedButton(
                                  onPressed: _handleChangePassword,
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
                                    'Ganti Password',
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
