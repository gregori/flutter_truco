import 'package:flutter_truco/components/playing_card.dart';
import 'package:flutter_truco/constants.dart';
import 'package:flutter_truco/models/card_model.dart';
import 'package:flutter_truco/models/player_model.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({
    super.key,
    required this.player,
    this.size = 1,
    this.onPlayCard,
  });

  final double size;
  final PlayerModel player;
  final Function(CardModel)? onPlayCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight * size,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: player.cards.length,
        itemBuilder: (BuildContext context, int index) {
          final card = player.cards[index];
          return PlayingCard(
            card: card,
            size: size,
            visible: true,
            // visible: player.isHuman,
            onPlayCard: onPlayCard,
          );
        },
      ),
    );
  }
}
