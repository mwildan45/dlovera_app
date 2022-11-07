import 'dart:convert';

import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';

class ZoomedImage extends StatelessWidget {
  const ZoomedImage({Key? key, required this.imageData, required this.heroId}) : super(key: key);
  final String imageData;
  final String heroId;

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () {
        Navigator.of(context).pop();
      },
      // Note that scrollable widget inside DismissiblePage might limit the functionality
      // If scroll direction matches DismissiblePage direction
      direction: DismissiblePageDismissDirection.multi,
      isFullScreen: false,
      child: Hero(
        tag: heroId,
        child: Image.memory(
          base64Decode(imageData),
          fit: BoxFit.contain,
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   body: SafeArea(
    //     child: Container(
    //       width: double.maxFinite,
    //       height: double.maxFinite,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: MemoryImage(
    //             base64Decode(imageData),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}