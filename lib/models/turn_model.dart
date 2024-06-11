import 'package:flutter_truco/models/player_model.dart';

class TurnModel {
  final List<PlayerModel> players;
  int index;
  PlayerModel currentPlayer;
  int drawCount;
  int actionCount;

  TurnModel({
    required this.players,
    required this.currentPlayer,
    this.index = 0,
    this.drawCount = 0,
    this.actionCount = 0,
  });

  void nextTurn() {
    index += 1 % players.length;
    currentPlayer = players[index];
    drawCount = 0;
    actionCount = 0;
  }

  PlayerModel get nextPlayer {
    return players[(index + 1) % players.length];
  }

  PlayerModel get otherPlayer {
    return players.firstWhere((p) => p != currentPlayer);
  }
}
