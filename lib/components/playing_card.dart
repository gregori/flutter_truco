import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_truco/components/card_frame.dart';
import 'package:flutter_truco/constants.dart';
import 'package:flutter_truco/models/card_model.dart';
import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard({
    super.key,
    required this.card,
    this.size = 1,
    this.visible = false,
    this.onPlayCard,
  });

  final CardModel card;
  final double size;
  final bool visible;
  final Function(CardModel)? onPlayCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPlayCard != null) onPlayCard!(card);
      },
      child: CardFrame(
        color: Colors.blueGrey,
        size: size,
        child: _buildCard(),
      ),
    );
  }

  Widget? _buildCard() {
    var width = cardWidth * size;
    var height = cardHeight * size;

    return visible
        ? CachedNetworkImage(
            imageUrl: card.image,
            width: width,
            height: height,
          )
        : null;
  }
}
