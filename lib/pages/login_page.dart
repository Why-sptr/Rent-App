import 'package:flutter/material.dart';
import 'package:rent_app/pages/main_page.dart';
import 'package:rent_app/pages/register_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
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
                      onPressed: () {},
                    ),
                    Row(
                      children: [
                        const Text(
                          "Belum punya akun?",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
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
                              'Daftar',
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
                                        'Selamat Datang',
                                        style: AppTextStyles.header(context),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXSmall),
                                      Text(
                                        'Masukkan detail Anda di bawah ini',
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
                                      SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),
                                    ],
                                  ),

                                  // Bottom Section - Buttons
                                  Column(
                                    children: [
                                      // Sign In Button
                                      SizedBox(
                                        width: double.infinity,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: AppColors.buttonGradient,
                                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: _handleLogin,
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
                                              'Masuk',
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
                                              'Atau masuk dengan',
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
