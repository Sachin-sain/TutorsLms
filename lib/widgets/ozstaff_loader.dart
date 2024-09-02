import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorActivityIndicator extends StatelessWidget {
  final double? radius;
  final Color? color;
  const TutorActivityIndicator({super.key, this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: Theme.of(context).shadowColor,
      radius: radius ?? 20.0,
    );
  }
}
