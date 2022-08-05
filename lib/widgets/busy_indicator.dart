import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class BusyIndicator extends StatelessWidget {
  const BusyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style: SkeletonAvatarStyle(
        width: double.infinity,
        minHeight: MediaQuery.of(context).size.height / 8,
        maxHeight: MediaQuery.of(context).size.height / 3,
      ),
    );
  }
}
