import 'package:flutter_truco/models/card_model.dart';
import 'package:flutter/material.dart';

class TrumpCard extends StatelessWidget {
  final Suit suit;

  const TrumpCard({super.key, required this.suit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        CardModel.suitToUnicode(suit),
        style: TextStyle(
          fontSize: 24,
          color: CardModel.suitToColor(suit),
        ),
      ),
    );
  }
}
