import 'package:flutter_truco/components/card_frame.dart';
import 'package:flutter/material.dart';

class CardBack extends StatelessWidget {
  const CardBack({super.key, this.size = 1, this.child});

  final double size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CardFrame(
      color: Colors.blueGrey,
      child: child,
    );
  }
}
