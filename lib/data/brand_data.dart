import 'package:rent_app/models/brand_model.dart';

class BrandData {
  static final List<BrandModel> brands = [
    BrandModel(
      name: 'Hyundai',
      image: 'assets/images/brand/Hyundai.png',
      description: 'Hyundai adalah produsen otomotif asal Korea Selatan',
    ),
    BrandModel(
      name: 'Toyota',
      image: 'assets/images/brand/Toyota.png',
      description: 'Toyota adalah produsen otomotif asal Jepang terkemuka',
    ),
    BrandModel(
      name: 'Honda',
      image: 'assets/images/brand/Honda.png',
      description: 'Honda adalah produsen otomotif berkualitas dari Jepang',
    ),
    BrandModel(
      name: 'BYD',
      image: 'assets/images/brand/BYD.png',
      description: 'BYD adalah produsen kendaraan listrik dari China',
    ),
    BrandModel(
      name: 'Mitsubishi',
      image: 'assets/images/brand/Mitsubishi.png',
      description: 'Mitsubishi adalah produsen otomotif dari Jepang',
    ),
  ];
}
