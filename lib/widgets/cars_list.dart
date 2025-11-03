import 'package:flutter/material.dart';
import 'package:rent_app/models/car_model.dart';
import 'package:rent_app/widgets/car_card.dart';
import 'package:rent_app/config/app_constants.dart';

class CarsList extends StatelessWidget {
  final List<CarModel> cars;

  const CarsList({
    super.key,
    required this.cars,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.24,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.48),
        clipBehavior: Clip.none,
        padEnds: false,
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return CarCard(
            car: car,
            margin: EdgeInsets.only(
              left: index == 0 ? screenWidth * AppConstants.widthPaddingLarge : screenWidth * AppConstants.widthPaddingSmall,
              right: screenWidth * AppConstants.widthPaddingSmall,
            ),
            height: screenHeight * 0.24,
          );
        },
      ),
    );
  }
}
