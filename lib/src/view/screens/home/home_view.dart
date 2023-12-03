import 'package:flutter/material.dart';
import 'package:kicksmarket/src/constants/color_palettes.dart';
import 'package:kicksmarket/src/view/widget/category_card.dart';
import 'package:kicksmarket/src/view/widget/product_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.primary,
        toolbarHeight: 75.0,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text(
          "KicksMarket",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Palette.gray[0],
                ),
                height: 150.0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: const Text(
                              "30 % Discount off all shoes",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                            width: MediaQuery.of(context).size.width / 3.2,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Palette.button,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              child: const Text(
                                "Explore Now",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Palette.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 155.0,
                          height: 140.0,
                          child: Transform.flip(
                            flipX: true,
                            child: Image.asset(
                              'assets/images/nike_airforce_1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          // child: Container(
                          //   color: Colors.black,
                          // )
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 15.0),
              //   child: Container(
              //     child: TextField(
              //       onChanged: null,
              //       style: TextStyle(
              //         fontSize: 16.0,
              //         letterSpacing: 0.5,
              //       ),
              //       decoration: InputDecoration(
              //         filled: true,
              //         fillColor: Palette.gray[0],
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //           borderSide: BorderSide.none,
              //         ),
              //         hintText: "Search",
              //         hintStyle: TextStyle(),
              //       ),
              //     ),
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CategoryCard(title: "All"),
                    CategoryCard(title: "Nike"),
                  ],
                ),
              ),
              ProductCard(),
            ],
          ),
        ),
      ),
    );
  }
}
