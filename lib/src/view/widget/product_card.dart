import 'package:flutter/material.dart';
import 'package:kicksmarket/src/constants/color_palettes.dart';
import 'package:kicksmarket/src/models/shoes_model.dart';
import 'package:kicksmarket/src/utils/currency_formatter.dart';
import 'package:kicksmarket/src/view/screens/details/details_view.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
        ),
        itemCount: shoesModelList.length,
        itemBuilder: (context, index) {
          ShoesModel shoes = shoesModelList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailsView(shoes: shoes);
              }));
            },
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Palette.gray[3],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: [
                        Positioned(
                          right: 110.0,
                          bottom: 50.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border),
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: 25.0,
                            child: Image.asset(shoes.imageAsset),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(shoes.name),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          CurrencyFormat.convertToIdr(shoes.price),
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                              ),
                              color: Palette.button,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Palette.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
