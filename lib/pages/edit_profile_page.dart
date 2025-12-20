import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController namaController;
  late TextEditingController emailController;
  late TextEditingController umurController;
  late TextEditingController domisiliController;
  late TextEditingController teleponController;
  late TextEditingController genderController;
  late TextEditingController alamatController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: 'Wahyu Cahyo Saputra');
    emailController = TextEditingController(text: 'wahyu@gmail.com');
    umurController = TextEditingController(text: '20');
    domisiliController = TextEditingController(text: 'Semarang');
    teleponController = TextEditingController(text: '081234567890');
    genderController = TextEditingController(text: 'Laki-laki');
    alamatController = TextEditingController(text: 'Jl. Ahmad Yani No. 123, Semarang');
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    umurController.dispose();
    domisiliController.dispose();
    teleponController.dispose();
    genderController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Edit Profile',
                      style: AppTextStyles.titleBlack(context),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.11),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

              // Avatar Section
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryBlue,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundColor: Colors.grey[300],
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/avatar.jpg',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.width * 0.3,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.person,
                                size: MediaQuery.of(context).size.width * 0.1,
                                color: Colors.grey[600],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.backgroundWhite,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.textWhite,
                          size: MediaQuery.of(context).size.height * 0.018,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              // Informasi Umum Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informasi Umum',
                      style: AppTextStyles.titleBlack(context),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),

                    // Nama Lengkap
                    Text(
                      'Nama Lengkap',
                      style: AppTextStyles.label(context),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                    TextField(
                      controller: namaController,
                      style: AppTextStyles.bodyMedium(context),
                      decoration: InputDecoration(
                        hintText: 'Masukkan nama lengkap',
                        hintStyle: AppTextStyles.hint(context),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                          vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),

                    // Email
                    Text(
                      'Email',
                      style: AppTextStyles.label(context),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                    TextField(
                      controller: emailController,
                      style: AppTextStyles.bodyMedium(context),
                      decoration: InputDecoration(
                        hintText: 'email@gmail.com',
                        hintStyle: AppTextStyles.hint(context),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                          vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),

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
                              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                              TextField(
                                controller: umurController,
                                keyboardType: TextInputType.number,
                                style: AppTextStyles.bodyMedium(context),
                                decoration: InputDecoration(
                                  hintText: '18',
                                  hintStyle: AppTextStyles.hint(context),
                                  filled: true,
                                  fillColor: AppColors.backgroundLightGrey,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                                    vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                        // Domisili Field
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Domisili',
                                style: AppTextStyles.label(context),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                              TextField(
                                controller: domisiliController,
                                style: AppTextStyles.bodyMedium(context),
                                decoration: InputDecoration(
                                  hintText: 'Kota/Kab',
                                  hintStyle: AppTextStyles.hint(context),
                                  filled: true,
                                  fillColor: AppColors.backgroundLightGrey,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                                    vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.016),

                    // Nomor Telepon
                    Text(
                      'No. Telepon',
                      style: AppTextStyles.label(context),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                    TextField(
                      controller: teleponController,
                      style: AppTextStyles.bodyMedium(context),
                      decoration: InputDecoration(
                        hintText: '081234567890',
                        hintStyle: AppTextStyles.hint(context),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                          vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),

                    // Gender
                    Text(
                      'Gender',
                      style: AppTextStyles.label(context),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),
                    TextField(
                      controller: genderController,
                      style: AppTextStyles.bodyMedium(context),
                      decoration: InputDecoration(
                        hintText: 'Pilih gender',
                        hintStyle: AppTextStyles.hint(context),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                          vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

              // Dokumen Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dokumen',
                      style: AppTextStyles.titleBlack(context),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),

                    // Document 1
                    Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLightGrey,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        border: Border.all(
                          color: AppColors.borderGrey,
                          width: AppConstants.containerBorderWidth,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.file_present,
                              color: AppColors.primaryBlue,
                              size: MediaQuery.of(context).size.height * 0.026,
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SIM_Wahyu_Cahyo_Saputra',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.0155,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                                Text(
                                  '2.4 MB',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.013,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: MediaQuery.of(context).size.height * 0.026,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingSmall),

                    // Document 2
                    Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLightGrey,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        border: Border.all(
                          color: AppColors.borderGrey,
                          width: AppConstants.containerBorderWidth,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.file_present,
                              color: AppColors.primaryBlue,
                              size: MediaQuery.of(context).size.height * 0.026,
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'KTP_Wahyu_Cahyo_Saputra',
                                  style: AppTextStyles.bodySmall(context).copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '2.4 MB',
                                  style: AppTextStyles.hint(context),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: MediaQuery.of(context).size.height * 0.026,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

              // Peta Lokasi Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peta Lokasi',
                      style: AppTextStyles.titleBlack(context),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: const LatLng(-6.2088, 106.8456),
                            initialZoom: 13,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.rent_app',
                            ),
                            RichAttributionWidget(
                              attributions: [
                                TextSourceAttribution(
                                  'OpenStreetMap contributors',
                                  onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                                ),
                              ],
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: const LatLng(-6.2088, 106.8456),
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.location_on,
                                    color: AppColors.primaryBlue,
                                    size: MediaQuery.of(context).size.height * 0.032,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

              // Detail Alamat Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Alamat',
                      style: AppTextStyles.titleBlack(context),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingMedium),
                    TextField(
                      controller: alamatController,
                      maxLines: 3,
                      style: AppTextStyles.bodyMedium(context),
                      decoration: InputDecoration(
                        hintText: 'Masukkan alamat lengkap',
                        hintStyle: AppTextStyles.hint(context),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingLarge,
                          vertical: MediaQuery.of(context).size.height * 0.016,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),

              // Action Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium),
                child: Row(
                  children: [
                    // Batalkan Button
                    Expanded(
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
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.018),
                              child: Center(
                                child: Text(
                                  'Batalkan',
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
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    
                    // Simpan Button
                    Expanded(
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Profile berhasil disimpan!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.018),
                              child: Center(
                                child: Text(
                                  'Simpan',
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
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingXLarge),
            ],
          ),
        ),
      ),
    );
  }
}
