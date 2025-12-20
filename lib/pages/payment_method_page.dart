import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';
import 'package:rent_app/models/car_model.dart';
import 'package:rent_app/pages/history_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PaymentMethodPage extends StatefulWidget {
  final CarModel car;
  
  const PaymentMethodPage({super.key, required this.car});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String _selected = 'BRI';

  final List<_PayItem> _items = const [
    _PayItem('BRI', 'assets/images/bri.png'),
    _PayItem('BNI', 'assets/images/bni.png'),
    _PayItem('BCA', 'assets/images/bca.png'),
    _PayItem('Mandiri', 'assets/images/mandiri.png'),
    _PayItem('Dana', 'assets/images/dana.png'),
    _PayItem('Gopay', 'assets/images/gopay.png'),
  ];

  Widget _shadowCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        border: Border.all(color: Colors.black.withOpacity(0.04), width: AppConstants.containerBorderWidth),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 12,
            spreadRadius: 0,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _radioCircle(bool selected, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryBlue,
          width: 2,
        ),
      ),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: selected ? size * 0.5 : 0,
          height: selected ? size * 0.5 : 0,
          decoration: const BoxDecoration(
            color: AppColors.primaryBlue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
            vertical: MediaQuery.of(context).size.height * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundWhite,
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          border: Border.all(
                            color: AppColors.borderGrey,
                            width: AppConstants.containerBorderWidth,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.textBlack,
                          size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                        ),
                      ),
                    ),
                    // Title
                    Text(
                      'Pembayaran',
                      style: AppTextStyles.titleBlack(context),
                    ),
                    // Empty space for alignment
                    SizedBox(width: MediaQuery.of(context).size.width * 0.12),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

              // List of payment items
              Expanded(
                child: ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    final selected = item.name == _selected;
                    return _shadowCard(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                        onTap: () => setState(() => _selected = item.name),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                            vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                          ),
                          child: Row(
                            children: [
                              _radioCircle(selected, MediaQuery.of(context).size.height * 0.026),
                              SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: AppTextStyles.bodyMedium(context).copyWith(
                                    color: AppColors.textBlack,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Image.asset(
                                item.assetPath,
                                height: MediaQuery.of(context).size.height * 0.04,
                                errorBuilder: (_, __, ___) => Text(
                                  item.name,
                                  style: AppTextStyles.bodySmall(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),

              // Pay Now button
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.gradientStart1, AppColors.gradientEnd1],
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
                    onTap: () async {
                      // Create booking data
                      final bookingData = {
                        'id': DateTime.now().millisecondsSinceEpoch.toString(),
                        'carName': widget.car.name,
                        'carImage': widget.car.image,
                        'transmission': widget.car.transmission,
                        'maxSpeed': widget.car.maxSpeed,
                        'capacity': widget.car.capacity,
                        'duration': '2 Hari',
                        'location': widget.car.location,
                        'priceDetail': '2 Hari X  Rp. ${widget.car.price ~/ 1000}.000',
                        'subtotal': widget.car.price * 2,
                        'total': widget.car.price * 2 + 2500,
                        'paymentMethod': _selected,
                        'date': DateTime.now().toIso8601String(),
                      };

                      // Save to local storage
                      final prefs = await SharedPreferences.getInstance();
                      List<String> history = prefs.getStringList('booking_history') ?? [];
                      history.add(jsonEncode(bookingData));
                      await prefs.setStringList('booking_history', history);

                      // Navigate to history detail
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryDetailPage(booking: bookingData),
                          ),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.018),
                      child: Center(
                        child: Text(
                          'Bayar Sekarang',
                          style: AppTextStyles.button(context),
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

class _PayItem {
  final String name;
  final String assetPath;
  const _PayItem(this.name, this.assetPath);
}
