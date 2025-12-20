class CarModel {
  final String id;
  final String name;
  final String location;
  final String transmission;
  final int price;
  final String image;
  final int maxSpeed; // KM/J
  final int capacity; // Orang

  CarModel({
    required this.id,
    required this.name,
    required this.location,
    required this.transmission,
    required this.price,
    required this.image,
    this.maxSpeed = 200,
    this.capacity = 4,
  });
}
