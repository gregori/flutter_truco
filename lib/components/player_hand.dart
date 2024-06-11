import 'package:flutter/material.dart';
import 'package:flutter_truco/components/playing_card.dart';
import 'package:flutter_truco/models/card_model.dart';
import 'package:flutter_truco/models/player_model.dart';

class PlayerHand extends StatelessWidget {
  final PlayerModel player;
  final bool? vertical;
  final double size;
  final Function(CardModel)? onPlayCard;

  const PlayerHand({
    super.key,
    required this.player,
    this.vertical,
    this.size = 1,
    this.onPlayCard,
  });

  @override
  Widget build(BuildContext context) {
    bool isVertical = vertical ?? false;

    List<PlayingCard> cards = player.cards
        .map((card) => PlayingCard(
              card: card,
              size: size,
              visible: player.isHuman,
              onPlayCard: onPlayCard,
            ))
        .toList();

    return isVertical
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cards,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cards,
          );
  }
}
