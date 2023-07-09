import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsListBuilder extends StatelessWidget {
  DetailsListBuilder({
    super.key,
    required this.details,
  });

  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> details;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      height: 345,
      child: Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.bottom,
        interactive: true,
        // thumbVisibility: true,
        trackVisibility: true,
        controller: _scrollController,
        thickness: 10,
        child: ListView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          children: [
            ...details.map((e) => DetailsListItem(text: e["title"] as String,img: e["image"] as String ),),
          ],
        ),
      ),
    );
  }
}

class DetailsListItem extends StatelessWidget {
  const DetailsListItem({
    super.key, required this.text, required this.img,
  });

  final String text ;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            right: 20,
            bottom: 20
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
              img,
            ),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        width: 230,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.51),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),
                  )
              ),
              padding: const EdgeInsets.all(5),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              )),
        ));
  }
}