import 'package:flutter/material.dart';
import 'package:kicksmarket/src/constants/color_palettes.dart';
import 'package:kicksmarket/src/providers/cart_provider.dart';
import 'package:kicksmarket/src/view/widget/cart_card.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    loadShoes() async {
      Provider.of<CartProvider>(context, listen: false).carts;
      setState(() {});
    }

    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.secondary,
        toolbarHeight: 75.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      loadShoes();
                    });
                  });
                },
                color: Palette.textGray,
                child: ListView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  children: cartProvider.carts
                      .map((cart) => CartCard(cart: cart))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
