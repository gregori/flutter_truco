import 'package:flutter_truco/constants.dart';
import 'package:flutter/material.dart';

class CardFrame extends StatelessWidget {
  const CardFrame({
    super.key,
    this.size = 1,
    required this.color,
    this.child,
    this.margin,
  });

  final double size;
  final Color color;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    var width = cardWidth * size;
    var height = cardHeight * size;

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: child,
    );
  }
}
