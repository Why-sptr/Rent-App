import 'package:rent_app/models/car_model.dart';

class CarData {
  static final List<CarModel> availableCars = [
    CarModel(
      name: 'BYD Seal',
      location: 'Semarang',
      transmission: 'Matic',
      price: 150000,
      image: 'assets/images/car/BydSeal.png',
    ),
    CarModel(
      name: 'Hyundai Plaiside',
      location: 'Semarang',
      transmission: 'Manual',
      price: 200000,
      image: 'assets/images/car/HyundaiPalaside.png',
    ),
    CarModel(
      name: 'Honda HRV',
      location: 'Semarang',
      transmission: 'Matic',
      price: 180000,
      image: 'assets/images/car/HondaHRV.png',
    ),
    CarModel(
      name: 'Toyota Rush',
      location: 'Semarang',
      transmission: 'Manual',
      price: 170000,
      image: 'assets/images/car/ToyotaRush.png',
    ),
  ];
}
