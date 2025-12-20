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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      'Edit Profile',style: AppTextStyles.titleBlack(context),
                    ),
                    SizedBox(width: screenHeight * 0.03),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

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
                        radius: screenWidth * 0.15,
                        backgroundColor: Colors.grey[300],
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/avatar.jpg',
                            fit: BoxFit.cover,
                            width: screenWidth * 0.3,
                            height: screenWidth * 0.3,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.person,
                                size: screenWidth * 0.1,
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
                        padding: EdgeInsets.all(screenWidth * 0.02),
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
                          size: screenHeight * 0.018,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Informasi Umum Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informasi Umum',
                      style: TextStyle(
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.018),

                    // Nama Lengkap
                    Text(
                      'Nama Lengkap',
                      style: AppTextStyles.label(context),
                    ),
                    SizedBox(height: screenHeight * 0.008),
                    TextField(
                      controller: namaController,
                      style: TextStyle(
                        fontSize: screenHeight * 0.0165,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Masukkan nama lengkap',
                        hintStyle: AppTextStyles.hint(context).copyWith(
                          fontSize: screenHeight * 0.0155,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingLarge,
                          vertical: screenHeight * 0.016,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.016),

                    // Email
                    Text(
                      'Email',
                      style: AppTextStyles.label(context),
                    ),
                    SizedBox(height: screenHeight * 0.008),
                    TextField(
                      controller: emailController,
                      style: TextStyle(
                        fontSize: screenHeight * 0.0165,
                      ),
                      decoration: InputDecoration(
                        hintText: 'email@gmail.com',
                        hintStyle: AppTextStyles.hint(context).copyWith(
                          fontSize: screenHeight * 0.0155,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingLarge,
                          vertical: screenHeight * 0.016,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.016),

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
                              SizedBox(height: screenHeight * 0.008),
                              TextField(
                                controller: umurController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0165,
                                ),
                                decoration: InputDecoration(
                                  hintText: '18',
                                  hintStyle: AppTextStyles.hint(context).copyWith(
                                    fontSize: screenHeight * 0.0155,
                                  ),
                                  filled: true,
                                  fillColor: AppColors.backgroundLightGrey,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppConstants.paddingLarge,
                                    vertical: screenHeight * 0.016,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        // Domisili Field
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Domisili',
                                style: AppTextStyles.label(context),
                              ),
                              SizedBox(height: screenHeight * 0.008),
                              TextField(
                                controller: domisiliController,
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0165,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Kota/Kab',
                                  hintStyle: AppTextStyles.hint(context).copyWith(
                                    fontSize: screenHeight * 0.0155,
                                  ),
                                  filled: true,
                                  fillColor: AppColors.backgroundLightGrey,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppConstants.paddingLarge,
                                    vertical: screenHeight * 0.016,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.016),

                    // Nomor Telepon
                    Text(
                      'No. Telepon',
                      style: AppTextStyles.label(context),
                    ),
                    SizedBox(height: screenHeight * 0.008),
                    TextField(
                      controller: teleponController,
                      style: TextStyle(
                        fontSize: screenHeight * 0.0165,
                      ),
                      decoration: InputDecoration(
                        hintText: '081234567890',
                        hintStyle: AppTextStyles.hint(context).copyWith(
                          fontSize: screenHeight * 0.0155,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingLarge,
                          vertical: screenHeight * 0.016,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.016),

                    // Gender
                    Text(
                      'Gender',
                      style: AppTextStyles.label(context),
                    ),
                    SizedBox(height: screenHeight * 0.008),
                    TextField(
                      controller: genderController,
                      style: TextStyle(
                        fontSize: screenHeight * 0.0165,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Pilih gender',
                        hintStyle: AppTextStyles.hint(context).copyWith(
                          fontSize: screenHeight * 0.0155,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingLarge,
                          vertical: screenHeight * 0.016,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.028),

              // Dokumen Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dokumen',
                      style: TextStyle(
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.016),

                    // Document 1
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLightGrey,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.file_present,
                              color: AppColors.primaryBlue,
                              size: screenHeight * 0.026,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SIM_Wahyu_Cahyo_Saputra',
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.0155,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                                Text(
                                  '2.4 MB',
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.013,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: screenHeight * 0.026,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.012),

                    // Document 2
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLightGrey,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.file_present,
                              color: AppColors.primaryBlue,
                              size: screenHeight * 0.026,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'KTP_Wahyu_Cahyo_Saputra',
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.0155,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                                Text(
                                  '1.8 MB',
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.013,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: screenHeight * 0.026,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.028),

              // Peta Lokasi Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peta Lokasi',
                      style: TextStyle(
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.016),
                    Container(
                      height: screenHeight * 0.22,
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
                                    size: screenHeight * 0.032,
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

              SizedBox(height: screenHeight * 0.028),

              // Detail Alamat Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Alamat',
                      style: TextStyle(
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.016),
                    TextField(
                      controller: alamatController,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: screenHeight * 0.0165,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Masukkan alamat lengkap',
                        hintStyle: AppTextStyles.hint(context).copyWith(
                          fontSize: screenHeight * 0.0155,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundLightGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingLarge,
                          vertical: screenHeight * 0.016,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.028),

              // Action Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  children: [
                    // Batalkan Button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.016,
                          ),
                          side: const BorderSide(
                            color: AppColors.textPrimary,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          ),
                        ),
                        child: Text(
                          'Batalkan',
                          style: AppTextStyles.button(context).copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    
                    // Simpan Button
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: AppColors.buttonGradient,
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Profile berhasil disimpan!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.016,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                            ),
                          ),
                          child: Text(
                            'Simpan',
                            style: AppTextStyles.button(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
