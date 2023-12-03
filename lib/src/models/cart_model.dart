import 'package:kicksmarket/src/models/shoes_model.dart';

class CartModel {
  late int id;
  late ShoesModel shoes;
  late int quantity;

  CartModel({
    required this.id,
    required this.shoes,
    required this.quantity,
  });
}
