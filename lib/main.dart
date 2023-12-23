import 'package:flutter/material.dart';
import 'package:kicksmarket/src/constants/color_palettes.dart';
import 'package:kicksmarket/src/providers/cart_provider.dart';
import 'package:kicksmarket/src/view/screens/cart/cart_view.dart';
import 'package:kicksmarket/src/view/screens/home/home_view.dart';
import 'package:kicksmarket/src/view/screens/overview/overview_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'KicksMarket',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const OverviewView(),
          '/home': (context) => const HomeView(),
          '/cart': (context) => const CartView(),
        },
        theme: ThemeData(
          fontFamily: "Poppins",
          primaryColor: Palette.primary,
          useMaterial3: true,
        ),
      ),
    );
  }
}
