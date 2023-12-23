import 'package:flutter/material.dart';
import 'package:kicksmarket/src/constants/color_palettes.dart';
import 'package:kicksmarket/src/models/shoes_model.dart';
import 'package:kicksmarket/src/providers/cart_provider.dart';
import 'package:kicksmarket/src/utils/currency_formatter.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DetailsView extends StatelessWidget {
  final ShoesModel shoes;

  const DetailsView({super.key, required this.shoes});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.secondary,
        toolbarHeight: 75.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                color: Palette.secondary,
              ),
              height: 250.0,
              child: Center(
                child: Image.asset(
                  shoes.imageAsset,
                  height: 200.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        shoes.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(shoes.price),
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Brand: ",
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Palette.button,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: shoes.brand,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Palette.textGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    shoes.description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            cartProvider.addCart(shoes);
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              showConfirmBtn: false,
              backgroundColor: Palette.gray[0],
              barrierColor: Colors.transparent,
              animType: QuickAlertAnimType.slideInUp,
              autoCloseDuration: const Duration(seconds: 2),
              text: "The item has been successfully added",
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Palette.button,
            ),
            height: MediaQuery.of(context).size.height / 15,
            child: const Center(
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: Palette.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
