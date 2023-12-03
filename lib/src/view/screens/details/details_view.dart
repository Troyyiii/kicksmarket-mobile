import 'package:flutter/material.dart';
import 'package:kicksmarket/src/constants/color_palettes.dart';
import 'package:kicksmarket/src/models/shoes_model.dart';
import 'package:kicksmarket/src/utils/currency_formatter.dart';

class DetailsView extends StatelessWidget {
  final ShoesModel shoes;

  const DetailsView({super.key, required this.shoes});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
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
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
