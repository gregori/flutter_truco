import 'package:flutter/material.dart';
import 'package:flutter_truco/components/playing_card.dart';
import 'package:flutter_truco/models/card_model.dart';

class StackOfCards extends StatelessWidget {
  final int num;
  final List<CardModel> cards;
  final double offset;
  final double size;

  const StackOfCards({
    super.key,
    int num = 1,
    required this.cards,
    this.offset = 10.0,
    this.size = 1,
  }) : num = num > 0 ? num : 1;

  @override
  Widget build(BuildContext context) => Stack(
        children: List<Widget>.generate(
          cards.length,
          (int index) {
            final card = cards[index];
            return Positioned(
              bottom: index * offset,
              left: index * offset,
              top: (num - index - 1) * offset,
              right: (num - index - 1) * offset,
              child: PlayingCard(
                card: card,
                size: size,
                visible: true,
              ),
            );
          },
        ),
      );
}
