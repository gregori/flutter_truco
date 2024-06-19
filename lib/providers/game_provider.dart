import 'dart:core';

import 'package:collection/collection.dart';
import 'package:flutter_truco/constants.dart';
import 'package:flutter_truco/main.dart';
import 'package:flutter_truco/models/card_model.dart';
import 'package:flutter_truco/models/deck_model.dart';
import 'package:flutter_truco/models/player_model.dart';
import 'package:flutter_truco/models/turn_model.dart';
import 'package:flutter_truco/services/deck_service.dart';
import 'package:flutter/material.dart';

abstract class GameProvider with ChangeNotifier {
  GameProvider() {
    _service = DeckService();
  }

  late DeckService _service;
  late TurnModel turn;

  DeckModel? currentDeck;
  CardModel? flipCard;
  List<PlayerModel> players = [];
  PriorityQueue<CardModel> discards = PriorityQueue();
  CardModel? get topDiscard => discards.isNotEmpty ? discards.first : null;

  Map<String, dynamic> gameState = {};
  Widget? bottomWidget;

  Future<void> newHand(List<PlayerModel> players) async {
    final deck = await _service.newDeck();
    currentDeck = deck;
    this.players = players;
    discards.clear();
    turn = TurnModel(players: players, currentPlayer: players.first);
    await setupBoard();
    notifyListeners();
  }

  Future<void> setupBoard() async {}

  Future<void> drawCards(
    PlayerModel player, {
    int count = 1,
    bool allowAnyTime = false,
  }) async {
    if (currentDeck == null) return;
    if (!allowAnyTime) return;

    final draw = await _service.drawCards(currentDeck!, count: count);
    player.addCards(draw.cards);

    currentDeck!.remaining = draw.remaining;

    notifyListeners();
  }

  void endTurn() {
    turn.nextTurn();
    if (turn.currentPlayer.isBot) {
      botTurn();
    }
    notifyListeners();
  }

  void skipTurn() {
    turn.nextTurn();
    turn.nextTurn();

    notifyListeners();
  }

  bool get canEndTurn => true;

  Future<void> botTurn() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await drawCards(turn.currentPlayer);
    await Future.delayed(const Duration(milliseconds: 500));

    if (turn.currentPlayer.cards.isNotEmpty) {
      await Future.delayed(const Duration(milliseconds: 1000));

      playCard(
        player: turn.currentPlayer,
        card: turn.currentPlayer.cards.first,
      );
    }

    if (canEndTurn) {
      endTurn();
    }
  }

  PlayerModel get currentPlayer {
    return turn.currentPlayer;
  }

  bool canPlayCard(CardModel card) {
    return turn.actionCount < 1;
  }

  Future<void> playCard(
      {required PlayerModel player, required CardModel card}) async {
    if (!canPlayCard(card)) return;

    player.removeCard(card);
    discards.add(card);

    turn.actionCount++;

    setLastPlayed(card);

    await applyTrumpCardValue(card);

    notifyListeners();
  }

  Future<void> drawFlipCard({int count = 1}) async {
    if (currentDeck == null) return;
    final draw = await _service.drawCards(currentDeck!, count: count);

    flipCard = draw.cards.first;
    currentDeck!.remaining = draw.remaining;
    notifyListeners();
  }

  void setLastPlayed(CardModel card) {
    gameState[gsLastSuit] = card.suit;
    gameState[gsLastValue] = card.faceValue;

    notifyListeners();
  }

  Future<void> applyTrumpCardValue(CardModel card) async {}

  void showToast(String message, {int seconds = 3, SnackBarAction? action}) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: seconds),
        action: action,
      ),
    );
  }
}
