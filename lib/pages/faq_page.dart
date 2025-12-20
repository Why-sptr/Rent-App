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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.015,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.028),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.textBlack,
                        size: screenHeight * 0.022,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'FAQ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenHeight * 0.027,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.11),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundLightGrey,
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: screenHeight * 0.0165,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'Cari pertanyaan',
                    hintStyle: AppTextStyles.hint(context).copyWith(
                      fontSize: screenHeight * 0.0155,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[400],
                      size: screenHeight * 0.028,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.016,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.025),

            // FAQ Items
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                children: [
                  // FAQ Items
                  ...List.generate(faqItems.length, (index) {
                    final isExpanded = expandedIndex == index;
                    return Container(
                      margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundWhite,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.005,
                          ),
                          title: Text(
                            faqItems[index]['question']!,
                            style: TextStyle(
                              fontSize: screenHeight * 0.0175,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBlack,
                            ),
                          ),
                          trailing: Icon(
                            isExpanded ? Icons.remove : Icons.add,
                            color: AppColors.textBlack,
                            size: screenHeight * 0.024,
                          ),
                          onExpansionChanged: (expanded) {
                            setState(() {
                              expandedIndex = expanded ? index : null;
                            });
                          },
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                screenWidth * 0.04,
                                0,
                                screenWidth * 0.04,
                                screenHeight * 0.02,
                              ),
                              child: Text(
                                faqItems[index]['answer']!,
                                style: TextStyle(
                                  fontSize: screenHeight * 0.016,
                                  color: Colors.grey[600],
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  SizedBox(height: screenHeight * 0.02),

                  // Bottom Section - Punya pertanyaan lainnya
                  Container(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.03),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.045,
                      vertical: screenHeight * 0.022,
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
                          style: TextStyle(
                            fontSize: screenHeight * 0.019,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textWhite,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
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
                                vertical: screenHeight * 0.016,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                              ),
                            ),
                            child: Text(
                              'Hubungi Admin',
                              style: TextStyle(
                                fontSize: screenHeight * 0.019,
                                fontWeight: FontWeight.w600,
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
