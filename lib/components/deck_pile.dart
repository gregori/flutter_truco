import 'package:flutter_truco/components/card_back.dart';
import 'package:flutter/material.dart';

class DeckPile extends StatelessWidget {
  const DeckPile({
    super.key,
    required this.remaining,
    this.size = 1,
    this.canDraw = false,
  });

  final int remaining;
  final double size;
  final bool canDraw;

  @override
  Widget build(BuildContext context) {
    return CardBack(
        size: size,
        child: Center(
            child: Text(
          '$remaining',
          style: const TextStyle(
            color: Colors.white,
          ),
        )));
  }
}
