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
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
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
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
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
              Seperator(),
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
              Seperator(),
              Align(
                child: Container(
                  margin: EdgeInsets.all(7),
                  color: Color(0xffFFD0D0),
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
                          decoration: BoxDecoration(
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
                          decoration: BoxDecoration(
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
                          child: Text(
                            "TAKE SURVEY",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyle.backgroundColor,
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
              Container(
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    controller: _reviewScrollController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ReviewCard(),
                      ReviewCard(),
                      ReviewCard(),
                      ReviewCard(),
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

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
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
                    style: AppStyle.primaryFontStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: Container(),
              ),
            ],
          ),
          Container(
            width: 260,
            height: 320,
            child: const Text(
              "Sapiente occaecati exercitationem quasi eum corporis sit. Aut consectetur maxime debitis quam voluptatem aut consequatur voluptatum.Sapiente occaecati exercitationem quasi eum corporis sit. Aut consectetur maxime debitis quam voluptatem aut quasi eum corporis sit. Aut consectetur maxime debitis quam voluptatem aut ",
              style: TextStyle(
                  fontFamily: "poppins", fontSize: 17),
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
          decoration: BoxDecoration(
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
