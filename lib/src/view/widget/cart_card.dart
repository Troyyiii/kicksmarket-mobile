import 'package:flutter/material.dart';
import 'package:kicksmarket/src/constants/color_palettes.dart';
import 'package:kicksmarket/src/models/cart_model.dart';
import 'package:kicksmarket/src/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;

  const CartCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Palette.gray[2],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                cart.shoes.imageAsset,
                height: 60.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.shoes.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    cart.shoes.brand,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  cartProvider.reduceQuantity(cart);
                },
                child: const Icon(
                  Icons.remove_circle_outline_rounded,
                ),
              ),
              SizedBox(
                width: 25,
                child: Center(
                  child: Text(cart.quantity.toString()),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cartProvider.addQuantity(cart);
                },
                child: const Icon(
                  Icons.add_circle_outline_rounded,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
