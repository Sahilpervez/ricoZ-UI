import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricoz_ui/Utils/app_styles.dart';
import 'package:ricoz_ui/providers/database.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Widgets/carousel_1.dart';
import '../Widgets/details_list.dart';
import '../Widgets/micro_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    final services = data.services;
    final servicesDetails = data.servicesDetails;
    final courses = data.courses;
    final courseDetails = data.courseDetails;
    final _servicesScrollController = ScrollController();
    final _coursesScrollController = ScrollController();
    final _reviewScrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/ricoZ.png"),
        leading: Container(
          margin: const EdgeInsets.only(left: 12.0),
          child: Image.asset("assets/profileIMG.png"),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: AppStyle.backgroundColor,
      ),
      backgroundColor: AppStyle.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Carousel_1_Builder(
                      constraints: constraints,
                    ),
                    MicroDetailsBuilder(
                      title: "Services",
                      builderList: services,
                      constraints: constraints,
                      controller: _servicesScrollController,
                    ),
                    DetailsListBuilder(
                      details: servicesDetails,
                    ),
                    const Seperator(),
                    MicroDetailsBuilder(
                      title: "Courses",
                      builderList: courses,
                      constraints: constraints,
                      controller: _coursesScrollController,
                      showMore: true,
                    ),
                    DetailsListBuilder(
                      details: courseDetails,
                    ),
                    const Seperator(),
                    Align(
                      child: Container(
                        margin: const EdgeInsets.all(7),
                        color: const Color(0xffFFD0D0),
                        width: (constraints.maxWidth > 700)
                            ? constraints.maxWidth - 30
                            : constraints.maxWidth * 0.95,
                        height: (constraints.maxWidth > 700)
                            ? constraints.maxWidth * 0.5
                            : constraints.maxWidth * 0.47,
                        child: Stack(
                          children: [
                            Positioned(
                              right: -constraints.maxWidth * 0.2,
                              top: -constraints.maxWidth * 0.2,
                              child: Container(
                                height: constraints.maxWidth * 0.4,
                                width: constraints.maxWidth * 0.4,
                                decoration: const BoxDecoration(
                                  color: AppStyle.backgroundColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              right: constraints.maxWidth * 0.0825,
                              top: constraints.maxWidth * 0.0375,
                              child: Container(
                                width: constraints.maxWidth * 0.35,
                                height: constraints.maxWidth * 0.35,
                                decoration: const BoxDecoration(
                                  color: Color(0xff7E0505),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: constraints.maxWidth * 0.06,
                              right: constraints.maxWidth * 0.02,
                              child: Image.asset(
                                "assets/Images/takeASurvey.png",
                                height: constraints.maxWidth * 0.4,
                                // width: constraints.maxWidth * 0.6,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Positioned(
                              left: 34,
                              bottom: 15,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppStyle.backgroundColor,
                                ),
                                child: const Text(
                                  "TAKE SURVEY",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 34,
                              top: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Help us shape",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "THE FUTURE",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "of our app with you",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "feedback",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ReviewSectionBuilder(
                        reviewScrollController: _reviewScrollController),
                    KnowMoreCard(
                      constraints: constraints,
                    ),
                  ],
                ),
              ),
              Container(
                height: constraints.maxHeight - 100,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  color: Color(0xC86C1818),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ricoz",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "poppins"),
                        textAlign: TextAlign.start,
                      ),
                      Divider(),
                      Text(
                        "About Us",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Culture",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Investors",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Careers",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Contact",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Our Benefits",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sitemap",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Information",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: "poppins"),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.add, color: Color(0xffeebc7a)),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Policies",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: "poppins"),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.add, color: Color(0xffeebc7a)),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class KnowMoreCard extends StatelessWidget {
  const KnowMoreCard({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 7, right: 7),
        color: const Color(0xffFFD0D0),
        width: (constraints.maxWidth > 700)
            ? constraints.maxWidth - 30
            : constraints.maxWidth * 0.95,
        height: (constraints.maxWidth > 700)
            ? constraints.maxWidth * 0.5
            : constraints.maxWidth * 0.47,
        child: Stack(
          children: [
            Positioned(
              left: -constraints.maxWidth * 0.2,
              bottom: -constraints.maxWidth * 0.2,
              child: Container(
                height: constraints.maxWidth * 0.4,
                width: constraints.maxWidth * 0.4,
                decoration: const BoxDecoration(
                  color: AppStyle.backgroundColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: constraints.maxWidth * 0.042,
              top: constraints.maxWidth * 0.05,
              child: Container(
                width: constraints.maxWidth * 0.2,
                height: constraints.maxWidth * 0.2,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: AppStyle.backgroundColor, width: 15),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: constraints.maxWidth * 0.04,
              left: constraints.maxWidth * 0.02,
              child: Image.asset(
                "assets/Images/aboutUs_img.png",
                height: constraints.maxWidth * 0.41,
                // width: constraints.maxWidth * 0.6,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              right: 65,
              bottom: 20,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyle.backgroundColor,
                ),
                child: const Text(
                  "Know More",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Positioned(
              right: 34,
              top: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ABOUT US",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: Text(
                      "Simplifying the way India tech requirements",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewSectionBuilder extends StatelessWidget {
  const ReviewSectionBuilder({
    super.key,
    required ScrollController reviewScrollController,
  }) : _reviewScrollController = reviewScrollController;

  final ScrollController _reviewScrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      height: 455,
      child: Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.bottom,
        interactive: true,
        // thumbVisibility: true,
        trackVisibility: true,
        controller: _reviewScrollController,
        thickness: 10,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          controller: _reviewScrollController,
          scrollDirection: Axis.horizontal,
          children: const [
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 441,
      width: 300,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: Container()),
              Image.asset(
                "assets/Images/reviewer.png",
              ),
              Column(
                children: [
                  Container(
                    height: 40,
                  ),
                  Text(
                    "Leticia Kutch",
                    style: AppStyle.primaryFontStyle
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: Container(),
              ),
            ],
          ),
          const SizedBox(
            width: 260,
            height: 320,
            child: Text(
              "Sapiente occaecati exercitationem quasi eum corporis sit. Aut consectetur maxime debitis quam voluptatem aut consequatur voluptatum.Sapiente occaecati exercitationem quasi eum corporis sit. Aut consectetur maxime debitis quam voluptatem aut quasi eum corporis sit. Aut consectetur maxime debitis quam voluptatem aut ",
              style: TextStyle(fontFamily: "poppins", fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}

class Seperator extends StatelessWidget {
  const Seperator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(1.5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          height: 10,
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.all(1.5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          height: 10,
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.all(1.5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          height: 10,
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.all(1.5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          height: 10,
          width: 10,
        ),
      ],
    );
  }
}

// padding: const EdgeInsets.symmetric(
// horizontal: 10,
// vertical: 20,
// ),
