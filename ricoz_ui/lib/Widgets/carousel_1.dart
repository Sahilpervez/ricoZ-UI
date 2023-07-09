import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Utils/app_styles.dart';

class Carousel_1_Builder extends StatelessWidget {
  Carousel_1_Builder({
    super.key,
    required this.constraints,
  });

  final _carousel1Controller = PageController();
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: constraints.maxWidth > 380
              ? 160
              : constraints.maxHeight * 0.25 + 10,
          child: PageView(
            controller: _carousel1Controller,
            children: [
              Carousel1Elements(
                constraints: constraints,
              ),
              Carousel1Elements(
                constraints: constraints,
              ),
              Carousel1Elements(
                constraints: constraints,
              ),
              Carousel1Elements(
                constraints: constraints,
              ),
              Carousel1Elements(
                constraints: constraints,
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _carousel1Controller,
          count: 5,
          effect: WormEffect(
            dotColor: Colors.white,
            radius: 5,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 5,
            activeDotColor: Color(0xfff8d8b4),
          ),
        ),
      ],
    );
  }
}

class Carousel1Elements extends StatelessWidget {
  Carousel1Elements({super.key, required this.constraints});

  var constraints;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          // color: Colors.white,
        ),
        width: min(constraints.maxWidth * 0.95, 392),
        height: constraints.maxWidth > 380 ? 150 : constraints.maxHeight * 0.25,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.white,
                ),
                width: min(constraints.maxWidth * 0.95, 392),
                height: constraints.maxWidth > 380
                    ? 150
                    : constraints.maxHeight * 0.25,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                child: Image.asset(
                  "assets/Images/Carousel_1_assets/wave_1.png",
                  fit: BoxFit.contain,
                  width: 372,
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 19,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: (constraints.maxWidth < 380)
                        ? 140
                        : min(constraints.maxWidth * 0.5, 180),
                    // height: constraints.maxWidth>420 ? 150 : constraints.maxHeight * 0.24,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Invite Your Friend to ricoz",
                          style: AppStyle.primaryFontStyle.copyWith(
                              fontSize: (constraints.maxWidth < 380) ? 17 : 21),
                        ),
                        SizedBox(
                          height: (constraints.maxWidth < 380)
                              ? 10
                              : constraints.maxHeight * 0.015,
                        ),
                        Text(
                          "Get exciting Offers and deals as rewards",
                          style: AppStyle.primaryFontStyle.copyWith(
                            fontSize: (constraints.maxWidth < 380) ? 11 : 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 70,
              bottom: 44,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  "assets/Images/Carousel_1_assets/pngs/2.png",
                  height: (constraints.maxWidth < 380) ? 45 : 70,
                  width: (constraints.maxWidth < 380) ? 45 : 70,
                ),
              ),
            ),
            Positioned(
              right: (constraints.maxWidth < 380) ? 25 : 20,
              bottom: (constraints.maxWidth < 380) ? 15 : 10,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  "assets/Images/Carousel_1_assets/pngs/3.png",
                  height: (constraints.maxWidth < 380) ? 45 : 70,
                  width: (constraints.maxWidth < 380) ? 45 : 70,
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 10,
              child: Image.asset(
                "assets/Images/Carousel_1_assets/pngs/1.png",
                height: (constraints.maxWidth < 380) ? 40 : 60,
                width: (constraints.maxWidth < 380) ? 40 : 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}