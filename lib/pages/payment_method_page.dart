import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

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
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * AppConstants.widthPaddingLarge,
            vertical: h * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              SizedBox(
                height: h * 0.06,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(w * 0.028),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundWhite,
                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: AppConstants.containerBorderWidth,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.textBlack,
                            size: h * 0.022,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Pembayaran',
                        style: AppTextStyles.titleBlack(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(width: w * 0.12),
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.02),

              // List of payment items
              Expanded(
                child: ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => SizedBox(height: h * 0.012),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    final selected = item.name == _selected;
                    return _shadowCard(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                        onTap: () => setState(() => _selected = item.name),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.04,
                            vertical: h * 0.016,
                          ),
                          child: Row(
                            children: [
                              _radioCircle(selected, h * 0.026),
                              SizedBox(width: w * 0.03),
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: h * 0.016,
                                    color: AppColors.textBlack,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Image.asset(
                                item.assetPath,
                                height: h * 0.04,
                                errorBuilder: (_, __, ___) => Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: h * 0.014,
                                    color: Colors.grey[600],
                                  ),
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

              SizedBox(height: h * 0.01),

              // Pay Now button
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.gradientStart1, AppColors.gradientEnd1],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Bayar ${_selected} diproses...'),
                          backgroundColor: AppColors.primaryBlue,
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.018),
                      child: Center(
                        child: Text(
                          'Bayar Sekarang',
                          style: TextStyle(
                            fontSize: h * 0.0175,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textWhite,
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
      ),
    );
  }
}

class _PayItem {
  final String name;
  final String assetPath;
  const _PayItem(this.name, this.assetPath);
}
