import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  int? expandedIndex;

  final List<Map<String, String>> faqItems = [
    {
      'question': 'Apa saja mobil yang tersedia?',
      'answer': 'Kami menyediakan berbagai jenis mobil mulai dari city car, SUV, MPV, hingga mobil mewah. Semua mobil dalam kondisi terawat dan siap pakai.',
    },
    {
      'question': 'Bagaimana cara memesan mobil?',
      'answer': 'Caranya adalah pilih mobil yang ingin kamu pesan selanjutnya tentukan lokasi dan durasi. Setelah itu bayar dan tunjukan QR ke admin',
    },
    {
      'question': 'Dimana saja lokasi tersedia?',
      'answer': 'Kami melayani penyewaan di seluruh kota besar di Indonesia seperti Jakarta, Bandung, Surabaya, Semarang, Yogyakarta, dan kota-kota lainnya.',
    },
    {
      'question': 'Apakah bisa tambah durasi penyewaan?',
      'answer': 'Tentu bisa! Anda dapat menghubungi admin kami untuk perpanjangan durasi sewa. Biaya tambahan akan dihitung secara proporsional.',
    },
    {
      'question': 'Syarat sewa apa saja?',
      'answer': 'Syarat sewa meliputi: KTP asli, SIM A yang masih berlaku, deposit sesuai jenis mobil, dan mengisi formulir penyewaan.',
    },
    {
      'question': 'Apakah ditanggung asuransi?',
      'answer': 'Ya, semua mobil yang disewakan sudah tercover asuransi all risk. Namun ada ketentuan khusus untuk klaim yang dapat Anda tanyakan ke admin.',
    },
    {
      'question': 'Metode pembayarannya apa saja?',
      'answer': 'Kami menerima pembayaran melalui transfer bank, e-wallet (GoPay, OVO, Dana), dan kartu kredit/debit.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.borderGrey,
                          width: AppConstants.containerBorderWidth,
                        ),
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.textBlack,
                        size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                      ),
                    ),
                  ),
                  Text(
                    'FAQ',
                    style: AppTextStyles.titleBlack(context),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.11),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundLightGrey,
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.0165,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'Cari pertanyaan',
                    hintStyle: AppTextStyles.hint(context),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.iconGrey,
                      size: MediaQuery.of(context).size.height * AppConstants.iconSizeLarge,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

            // FAQ Items
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
              child: Column(
                children: [
                  // FAQ Items
                  ...List.generate(faqItems.length, (index) {
                    final isExpanded = expandedIndex == index;
                    return Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundWhite,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        border: Border.all(
                          color: AppColors.borderGrey,
                          width: AppConstants.containerBorderWidth,
                        ),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                            vertical: MediaQuery.of(context).size.height * AppConstants.spacingXSmall,
                          ),
                          title: Text(
                            faqItems[index]['question']!,
                            style: AppTextStyles.bodyLarge(context).copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: Icon(
                            isExpanded ? Icons.remove : Icons.add,
                            color: AppColors.textBlack,
                            size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                          ),
                          onExpansionChanged: (expanded) {
                            setState(() {
                              expandedIndex = expanded ? index : null;
                            });
                          },
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                                0,
                                MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                                MediaQuery.of(context).size.height * AppConstants.spacingLarge,
                              ),
                              child: Text(
                                faqItems[index]['answer']!,
                                style: AppTextStyles.bodyMedium(context).copyWith(
                                  color: AppColors.iconGrey,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                  // Bottom Section - Punya pertanyaan lainnya
                  Container(
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                      vertical: MediaQuery.of(context).size.height * AppConstants.spacingLarge,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.gradientStart1, AppColors.gradientEnd1],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Punya pertanyaan lainnya?',
                          style: AppTextStyles.titleBlack(context).copyWith(
                            color: AppColors.textWhite,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Action untuk hubungi admin
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Menghubungi admin...'),
                                  backgroundColor: AppColors.primaryBlue,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.backgroundWhite,
                              padding: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                              ),
                            ),
                            child: Text(
                              'Hubungi Admin',
                              style: AppTextStyles.button(context).copyWith(
                                color: AppColors.textBlack,
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
          ],
        ),
      ),
    );
  }
}

