import 'package:flutter/material.dart';
import 'package:kicksmarket/src/constants/color_palettes.dart';
import 'package:kicksmarket/src/view/widget/button.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 50.0,
                    left: 60.0,
                    child: Image.asset(
                      'assets/images/nike_airmax_97.png',
                      height: MediaQuery.of(context).size.height * 0.52,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Upgrade Your Sneakers game with us",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      color: Palette.textGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    "Looking for the perfect pair of shoes? Look no further! Our shoe store has everything you need to step up your style game",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      color: Palette.textGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30.0),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 14.0,
                      width: MediaQuery.of(context).size.width,
                      child: Button(
                        title: "Get Started",
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/home'),
                        fontSize: 16.0,
                        letterSpacing: 1.0,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
