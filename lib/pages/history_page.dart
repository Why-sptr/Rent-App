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
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // Header dan Search Bar
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                        vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                'Riwayat',
                                style: AppTextStyles.titleBlack(context),
                              ),
                              Container(
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
                                  Icons.tune,
                                  color: AppColors.textBlack,
                                  size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                          // Search Bar
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.backgroundGrey,
                              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                            ),
                            child: TextField(
                              controller: _searchController,
                              style: AppTextStyles.bodyMedium(context),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: 'Cari mobil',
                                hintStyle: AppTextStyles.hint(context),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.iconGrey,
                                  size: MediaQuery.of(context).size.height * AppConstants.iconSizeMedium,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),

                          // Filter Chips
                          Row(
                            children: [
                              _buildFilterChip('Pending'),
                              SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                              _buildFilterChip('Berhasil'),
                              SizedBox(width: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall),
                              _buildFilterChip('Selesai'),
                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),
                        ],
                      ),
                    ),
                  ),

                  // List of bookings
                  _filteredBookings.isEmpty
                      ? SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.history,
                                  size: MediaQuery.of(context).size.height * 0.08,
                                  color: AppColors.iconGrey,
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * AppConstants.spacingLarge),
                                Text(
                                  _searchController.text.isNotEmpty
                                      ? 'Tidak ada hasil pencarian'
                                      : 'Belum ada riwayat pesanan',
                                  style: AppTextStyles.bodyLarge(context).copyWith(
                                    color: AppColors.iconGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SliverPadding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                            right: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                            bottom: MediaQuery.of(context).size.height * AppConstants.spacingLarge,
                          ),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final booking = _filteredBookings[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height * AppConstants.spacingMedium,
                                  ),
                                  child: _shadowCard(
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
                                      child: SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.135,
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
                                                      color: AppColors.iconGrey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Car details
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
                                                  vertical: MediaQuery.of(context).size.height * 0.012,
                                                ),
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
                                                            style: AppTextStyles.titleBlack(context),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(
                                                            horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingSmall,
                                                            vertical: MediaQuery.of(context).size.height * AppConstants.spacingXSmall,
                                                          ),
                                                          decoration: BoxDecoration(
                                                            color: AppColors.primaryBlue,
                                                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                                                          ),
                                                          child: Text(
                                                            'Sedan',
                                                            style: AppTextStyles.buttonSmall(context),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height * 0.004),
                                                    Text(
                                                      '${booking['transmission']}, ${booking['maxSpeed']} KM/J, ${booking['capacity']} Orang',
                                                      style: AppTextStyles.bodySmall(context).copyWith(
                                                        color: AppColors.iconGrey,
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.access_time,
                                                                size: MediaQuery.of(context).size.height * AppConstants.iconSizeSmall,
                                                                color: AppColors.iconGrey,
                                                              ),
                                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                                                              Flexible(
                                                                child: Text(
                                                                  booking['duration'],
                                                                  style: AppTextStyles.bodySmall(context).copyWith(
                                                                    color: AppColors.iconGrey,
                                                                  ),
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                                                        Flexible(
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.location_on_outlined,
                                                                size: MediaQuery.of(context).size.height * AppConstants.iconSizeSmall,
                                                                color: AppColors.iconGrey,
                                                              ),
                                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                                                              Flexible(
                                                                child: Text(
                                                                  booking['location'],
                                                                  style: AppTextStyles.bodySmall(context).copyWith(
                                                                    color: AppColors.iconGrey,
                                                                  ),
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                            ],
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
                                    ),
                                  ),
                                );
                              },
                              childCount: _filteredBookings.length,
                            ),
                          ),
                        ),
                ],
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
          horizontal: MediaQuery.of(context).size.width * AppConstants.widthPaddingMedium,
          vertical: MediaQuery.of(context).size.height * AppConstants.spacingSmall,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : AppColors.borderGrey,
            width: AppConstants.containerBorderWidth,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.buttonSmall(context).copyWith(
            color: isSelected ? AppColors.textWhite : AppColors.textBlack,
          ),
        ),
      ),
    );
  }
}
