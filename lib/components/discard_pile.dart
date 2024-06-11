import 'package:flutter_truco/components/playing_card.dart';
import 'package:flutter_truco/constants.dart';
import 'package:flutter_truco/models/card_model.dart';
import 'package:flutter/material.dart';

class DiscardPile extends StatelessWidget {
  const DiscardPile({super.key, required this.cards, this.size = 1});

  final List<CardModel> cards;
  final double size;

  @override
  Widget build(BuildContext context) {
    var width = cardWidth * size;
    var height = cardHeight * size;
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45, width: 2),
        ),
        child: Stack(
          children: cards
              .map((card) => PlayingCard(
                    card: card,
                    visible: true,
                  ))
              .toList(),
        ));
  }
}
