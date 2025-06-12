import 'package:get/get.dart';

class Product {
  String name;
  double price;
  String description;
  RxBool isFav = false.obs;

  Product({
    required this.name,
    required this.price,
    required this.description,
  });
}
