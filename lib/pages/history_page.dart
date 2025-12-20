import 'package:flutter/material.dart';
import 'package:rent_app/config/app_colors.dart';
import 'package:rent_app/config/app_constants.dart';
import 'package:rent_app/config/app_text_styles.dart';
import 'package:rent_app/pages/history_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HistoryPage extends StatefulWidget {
  final bool isEmbedded;
  
  const HistoryPage({super.key, this.isEmbedded = false});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> _bookings = [];
  List<Map<String, dynamic>> _filteredBookings = [];
  bool _isLoading = true;
  String _selectedFilter = 'Pending';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadHistory();
    _searchController.addListener(_filterBookings);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('booking_history') ?? [];
    
    setState(() {
      _bookings = history
          .map((e) => jsonDecode(e) as Map<String, dynamic>)
          .toList()
          .reversed
          .toList(); // Reverse to show newest first
      _filterBookings();
      _isLoading = false;
    });
  }

  void _filterBookings() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredBookings = _bookings.where((booking) {
        String carName = booking['carName'].toString().toLowerCase();
        String location = booking['location'].toString().toLowerCase();
        return carName.contains(query) || location.contains(query);
      }).toList();
    });
  }

  String _formatPrice(int price) {
    final s = price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return 'Rp$s';
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      final months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
      return '${date.day} ${months[date.month - 1]} ${date.year}';
    } catch (e) {
      return 'Invalid date';
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingLarge,
            vertical: MediaQuery.of(context).size.height * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.isEmbedded) {
                          // Do nothing or show a message
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.028),
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
                          size: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Riwayat',
                          style: AppTextStyles.titleBlack(context),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.028),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundWhite,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: AppConstants.containerBorderWidth,
                        ),
                      ),
                      child: Icon(
                        Icons.tune,
                        color: AppColors.textBlack,
                        size: MediaQuery.of(context).size.height * 0.022,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundGrey,
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                ),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.0165,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'Cari mobil',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: MediaQuery.of(context).size.height * 0.0155,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                      size: MediaQuery.of(context).size.height * 0.024,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                      vertical: MediaQuery.of(context).size.height * 0.015,
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Filter Chips
              Row(
                children: [
                  _buildFilterChip('Pending'),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  _buildFilterChip('Berhasil'),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  _buildFilterChip('Selesai'),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // List of bookings
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _filteredBookings.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.history,
                                  size: MediaQuery.of(context).size.height * 0.08,
                                  color: Colors.grey[400],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                Text(
                                  _searchController.text.isNotEmpty 
                                      ? 'Tidak ada hasil pencarian' 
                                      : 'Belum ada riwayat pesanan',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.018,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: _loadHistory,
                            child: ListView.separated(
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: _filteredBookings.length,
                              separatorBuilder: (_, __) => SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                              itemBuilder: (context, index) {
                                final booking = _filteredBookings[index];
                                return _shadowCard(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.135,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HistoryDetailPage(booking: booking),
                                          ),
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          // Car image
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(AppConstants.borderRadiusLarge),
                                              bottomLeft: Radius.circular(AppConstants.borderRadiusLarge),
                                            ),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.30,
                                              color: AppColors.backgroundGrey,
                                              child: Image.asset(
                                                booking['carImage'],
                                                fit: BoxFit.contain,
                                                errorBuilder: (_, __, ___) => Center(
                                                  child: Icon(
                                                    Icons.directions_car,
                                                    size: MediaQuery.of(context).size.height * 0.05,
                                                    color: Colors.grey[400],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Car details
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          booking['carName'],
                                                          style: TextStyle(
                                                            fontSize: MediaQuery.of(context).size.height * 0.0185,
                                                            fontWeight: FontWeight.bold,
                                                            color: AppColors.textBlack,
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.symmetric(
                                                          horizontal: MediaQuery.of(context).size.width * 0.025,
                                                          vertical: MediaQuery.of(context).size.height * 0.004,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: AppColors.primaryBlue,
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        child: Text(
                                                          'Sedan',
                                                          style: TextStyle(
                                                            fontSize: MediaQuery.of(context).size.height * 0.011,
                                                            fontWeight: FontWeight.w600,
                                                            color: AppColors.textWhite,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: MediaQuery.of(context).size.height * 0.006),
                                                  Text(
                                                    '${booking['transmission']}, ${booking['maxSpeed']} KM/J, ${booking['capacity']} Orang',
                                                    style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.height * 0.0135,
                                                      color: Colors.grey[600],
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.access_time,
                                                            size: MediaQuery.of(context).size.height * 0.016,
                                                            color: Colors.grey[600],
                                                          ),
                                                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                                                          Text(
                                                            booking['duration'],
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(context).size.height * 0.0125,
                                                              color: Colors.grey[600],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.location_on_outlined,
                                                            size: MediaQuery.of(context).size.height * 0.016,
                                                            color: Colors.grey[600],
                                                          ),
                                                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                                                          Text(
                                                            booking['location'],
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(context).size.height * 0.0125,
                                                              color: Colors.grey[600],
                                                            ),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ],
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

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.014,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.textWhite : AppColors.textBlack,
          ),
        ),
      ),
    );
  }
}
