import 'package:flutter_truco/components/discard_pile.dart';
import 'package:flutter_truco/components/new_game_button.dart';
import 'package:flutter_truco/components/player_hand.dart';
import 'package:flutter_truco/components/playing_card.dart';
import 'package:flutter_truco/providers/truco_game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrucoGameProvider>(
      builder: (context, model, child) {
        if (model.flipCard != null) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: PlayerHand(
                  player: model.players[1],
                  size: 0.8,
                  onPlayCard: (card) {},
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: PlayerHand(
                  player: model.players[2],
                  size: 0.8,
                  vertical: true,
                  onPlayCard: (card) {},
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DiscardPile(
                      cards: model.discards.toList(),
                      size: 0.8,
                    ),
                    PlayingCard(
                      card: model.flipCard!,
                      visible: true,
                      size: 0.8,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: PlayerHand(
                  player: model.players[3],
                  size: 0.8,
                  vertical: true,
                  onPlayCard: (card) {},
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (model.currentPlayer == model.players[0])
                            ElevatedButton(
                              onPressed: model.canCallRaise
                                  ? () {
                                      model.raiseRoundValue();
                                    }
                                  : null,
                              child: Text(model.getNextRoundValue()),
                            ),
                        ],
                      ),
                    ),
                    PlayerHand(
                      player: model.players[0],
                      size: 0.8,
                      onPlayCard: (card) {
                        model.playCard(player: model.players[0], card: card);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: NewGameButton(provider: model, color: Colors.blue),
          );
        }
      },
    );
  }
}
