import 'package:flutter/material.dart';
import 'package:rent_app/pages/main_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _ageController = TextEditingController();
  final _cityController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _ageController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      // Jika validasi berhasil, navigasi ke MainPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
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
                    Row(
                      children: [
                        const Text(
                          "Sudah punya akun?",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.paddingMedium,
                              vertical: AppConstants.paddingXSmall,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.textWhite.withValues(alpha: AppConstants.alphaButton),
                              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                            ),
                            child: const Text(
                              'Masuk',
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // RentKu Logo
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.015,
                ),
                child: Image.asset(
                  'assets/images/logo_rentku.png',
                  height: MediaQuery.of(context).size.height * 0.12,
                  fit: BoxFit.contain,
                ),
              ),

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
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width * 0.08,
                                  vertical: MediaQuery.of(context).size.height * 0.03,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Top Section - Title
                                    Column(
                                      children: [
                                        Text(
                                          'Daftar Akun',
                                          style: AppTextStyles.header(context),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall),
                                        Text(
                                          'Lengkapi data Anda untuk mendaftar',
                                          style: AppTextStyles.bodyMedium(context),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),

                                    // Middle Section - Form Fields
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),
                                        
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
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.018),

                                        // Password Field
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Password',
                                              style: AppTextStyles.label(context),
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall / 2),
                                            TextFormField(
                                              controller: _passwordController,
                                              obscureText: !_isPasswordVisible,
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

                                        // Confirm Password Field
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
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.018),

                                        // Umur and Domisili Row
                                        Row(
                                          children: [
                                            // Umur Field
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Umur',
                                                    style: AppTextStyles.label(context),
                                                  ),
                                                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall / 2),
                                                  TextFormField(
                                                    controller: _ageController,
                                                    keyboardType: TextInputType.number,
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Umur tidak boleh kosong';
                                                      }
                                                      final age = int.tryParse(value);
                                                      if (age == null || age < 17) {
                                                        return 'Minimal 17 tahun';
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      hintText: '18',
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
                                            ),
                                            const SizedBox(width: 15),
                                            // Domisili Field
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Domisili',
                                                    style: AppTextStyles.label(context),
                                                  ),
                                                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall / 2),
                                                  TextFormField(
                                                    controller: _cityController,
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Domisili tidak boleh kosong';
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      hintText: 'Kota/Kab',
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
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),
                                      ],
                                    ),

                                    // Bottom Section - Buttons
                                    Column(
                                      children: [
                                        // Register Button
                                        SizedBox(
                                          width: double.infinity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: AppColors.buttonGradient,
                                              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: _handleRegister,
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
                                                'Daftar',
                                                style: AppTextStyles.button(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall / 2),

                                        // Forgot Password
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Lupa kata sandi?',
                                            style: AppTextStyles.bodySmall(context),
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),

                                        // Divider
                                        Row(
                                          children: [
                                            const Expanded(child: Divider(color: AppColors.borderGrey)),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
                                              child: Text(
                                                'Atau daftar dengan',
                                                style: AppTextStyles.label(context),
                                              ),
                                            ),
                                            const Expanded(child: Divider(color: AppColors.borderGrey)),
                                          ],
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),

                                        // Social Buttons
                                        Row(
                                          children: [
                                            Expanded(
                                              child: OutlinedButton.icon(
                                                onPressed: () {},
                                                icon: Image.network(
                                                  'https://www.google.com/favicon.ico',
                                                  width: 18,
                                                  height: 18,
                                                ),
                                                label: Text(
                                                  'Google',
                                                  style: AppTextStyles.buttonSmall(context).copyWith(
                                                    color: AppColors.textPrimary,
                                                  ),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: MediaQuery.of(context).size.height * 0.014,
                                                  ),
                                                  side: const BorderSide(
                                                    color: AppColors.borderGrey,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: OutlinedButton.icon(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.facebook,
                                                  color: AppColors.facebookBlue,
                                                  size: 18,
                                                ),
                                                label: Text(
                                                  'Facebook',
                                                  style: AppTextStyles.buttonSmall(context).copyWith(
                                                    color: AppColors.facebookBlue,
                                                  ),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: MediaQuery.of(context).size.height * 0.014,
                                                  ),
                                                  side: const BorderSide(
                                                    color: AppColors.borderGrey,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
