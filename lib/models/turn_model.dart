import 'package:flutter_truco/models/player_model.dart';

class TurnModel {
  final List<PlayerModel> players;
  int index;
  PlayerModel currentPlayer;
  int actionCount;

  TurnModel({
    required this.players,
    required this.currentPlayer,
    this.index = 0,
    this.actionCount = 0,
  });

  void nextTurn() {
    index += 1 % players.length;
    currentPlayer = players[index];
    actionCount = 0;
  }

  PlayerModel get nextPlayer {
    return players[(index + 1) % players.length];
  }

  PlayerModel get otherPlayer {
    return players.firstWhere((p) => p != currentPlayer);
  }
}
