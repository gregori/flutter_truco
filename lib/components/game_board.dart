import 'package:flutter_truco/components/card_list.dart';
import 'package:flutter_truco/components/deck_pile.dart';
import 'package:flutter_truco/components/discard_pile.dart';
import 'package:flutter_truco/components/new_game_button.dart';
import 'package:flutter_truco/providers/truco_game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrucoGameProvider>(
      builder: (context, model, child) {
        if (model.currentDeck != null) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CardList(
                  player: model.players[1],
                  onPlayCard: (card) {},
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await model.drawCards(model.currentPlayer);
                          },
                          child: DeckPile(
                            remaining: model.currentDeck!.remaining,
                          ),
                        ),
                        const SizedBox(width: 8),
                        DiscardPile(cards: model.discards),
                      ],
                    ),
                    if (model.bottomWidget != null) model.bottomWidget!
                  ],
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
                              onPressed: model.canEndTurn
                                  ? () {
                                      model.endTurn();
                                    }
                                  : null,
                              child: const Text('End Turn'),
                            ),
                        ],
                      ),
                    ),
                    CardList(
                      player: model.players[0],
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
