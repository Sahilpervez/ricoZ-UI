import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/app_styles.dart';

class MicroDetailsBuilder extends StatelessWidget {
  const MicroDetailsBuilder({
    super.key,
    required this.title,
    required this.builderList,
    required this.constraints,
    required controller,
    this.showMore = false,
  }) : _controller = controller;

  final String title;
  final List<Map<String, String>> builderList;
  final BoxConstraints constraints;
  final _controller;
  final bool showMore;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: AppStyle.secondaryColor,
        borderRadius: BorderRadius.circular(9),
      ),
      height: (constraints.maxWidth / 103 >= builderList.length)
          ? 150
          : (showMore)
              ? 290
              : 282,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "${title}: ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: AppStyle.fontFamily),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: GridView(
              controller: _controller,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 110,
                childAspectRatio: 3 / 4,
                mainAxisExtent: 120,
              ),
              children: [
                ...builderList.map(
                  (e) => MicroDetailsItems(
                    image: e["image_png"] as String,
                    name: e["name"] as String,
                  ),
                ),
              ],
            ),
          ),
          if(showMore)
            Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  color: Colors.grey.shade800,
                  height: 2,
                  width: constraints.maxWidth * 0.2,
                ),
                Text(
                  "MORE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey.shade800,
                    fontFamily: AppStyle.fontFamily,
                  ),
                  textAlign: TextAlign.start,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  color: Colors.grey.shade800,
                  height: 2,
                  width: constraints.maxWidth * 0.2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MicroDetailsItems extends StatelessWidget {
  const MicroDetailsItems({
    super.key,
    required this.name,
    required this.image,
  });
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Column(
        // mainAxisAlignment: (constraints.maxWidth/103 >= length)?MainAxisAlignment.start:MainAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: AppStyle.backgroundColor,
              ),
            ),
            height: 53,
            width: 53,
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              image,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Container(
            width: 80,
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xff7E7D7D)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
