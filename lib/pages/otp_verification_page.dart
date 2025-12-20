import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_app/pages/change_password_page.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class OtpVerificationPage extends StatefulWidget {
  final String email;
  
  const OtpVerificationPage({super.key, required this.email});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    4,
    (index) => FocusNode(),
  );

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleVerify() {
    String otp = _otpControllers.map((c) => c.text).join();
    if (otp.length == 4) {
      // Handle OTP verification
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP berhasil diverifikasi'),
          backgroundColor: AppColors.primaryBlue,
        ),
      );
      // Navigate to change password page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon masukkan kode OTP lengkap'),
          backgroundColor: AppColors.borderRed,
        ),
      );
    }
  }

  void _handleResendOTP() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Kode OTP telah dikirim ulang'),
        backgroundColor: AppColors.primaryBlue,
      ),
    );
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
                  horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingXLarge,
                  vertical: MediaQuery.of(context).size.height * AppConstants.spacingLarge,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kode OTP',
                        style: AppTextStyles.header(context).copyWith(
                          color: AppColors.textWhite,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: AppTextStyles.bodyMedium(context).copyWith(
                            color: Colors.white70,
                          ),
                          children: [
                            const TextSpan(text: 'kode OTP telah dikirimkan ke '),
                            TextSpan(
                              text: widget.email,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textWhite,
                              ),
                            ),
                            const TextSpan(text: ', cek email untuk dapatkan kode'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingXLarge,
                        vertical: MediaQuery.of(context).size.height * AppConstants.spacingXLarge,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),
                          
                          // Title
                          Text(
                            'Masukan Kode OTP',
                            style: AppTextStyles.header(context),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge * 2),

                          // OTP Input Boxes
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              return SizedBox(
                                width: 60,
                                height: 60,
                                child: TextFormField(
                                  controller: _otpControllers[index],
                                  focusNode: _focusNodes[index],
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  style: AppTextStyles.titleLarge(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    counterText: '',
                                    filled: true,
                                    fillColor: AppColors.backgroundLightGrey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryBlue,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty && index < 3) {
                                      _focusNodes[index + 1].requestFocus();
                                    } else if (value.isEmpty && index > 0) {
                                      _focusNodes[index - 1].requestFocus();
                                    }
                                  },
                                ),
                              );
                            }),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge * 2),

                          // Confirm Button
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: AppColors.buttonGradient,
                                borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                              ),
                              child: ElevatedButton(
                                onPressed: _handleVerify,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding: EdgeInsets.symmetric(
                                    vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                  ),
                                ),
                                child: Text(
                                  'Konfirmasi',
                                  style: AppTextStyles.button(context),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                          // Resend OTP
                          Center(
                            child: RichText(
                              text: TextSpan(
                                style: AppTextStyles.bodySmall(context),
                                children: [
                                  const TextSpan(text: 'Belum menerima kode otp? '),
                                  WidgetSpan(
                                    child: GestureDetector(
                                      onTap: _handleResendOTP,
                                      child: Text(
                                        'Kirim ulang',
                                        style: AppTextStyles.bodySmall(context).copyWith(
                                          color: AppColors.primaryBlue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
