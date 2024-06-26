import 'package:flutter_truco/constants.dart';
import 'package:flutter_truco/models/card_model.dart';
import 'package:flutter_truco/providers/game_provider.dart';

class TrucoGameProvider extends GameProvider {
  @override
  Future<void> setupBoard() async {
    gameState[gsRoundValue] = 1;

    for (var p in players) {
      await drawCards(p, count: 3, allowAnyTime: true);
    }

    await drawFlipCard();
  }

  bool get canCallRaise => gameState[gsRoundValue] < 12;

  @override
  bool get canEndTurn => turn.actionCount > 0;

  @override
  Future<void> botTurn() async {
    final p = turn.currentPlayer;
    await Future.delayed(const Duration(milliseconds: 1000));

    for (final c in p.cards) {
      await playCard(player: p, card: c);
      return;
    }
  }

  @override
  Future<void> applyTrumpCardValue(CardModel card) async {
    if (card.value == flipCard!.value + 1) {
      card.value = getTrumpCardValue(card.suit);
    }
    notifyListeners();
  }

  int getTrumpCardValue(Suit suit) {
    switch (suit) {
      case Suit.diamonds:
        return 11;
      case Suit.spades:
        return 12;
      case Suit.hearts:
        return 13;
      case Suit.clubs:
        return 14;
      default:
        return 0;
    }
  }

  void raiseRoundValue() {
    switch (gameState[gsRoundValue]) {
      case 1:
        gameState[gsRoundValue] = 3;
        break;
      case 3:
        gameState[gsRoundValue] = 6;
        break;
      case 6:
        gameState[gsRoundValue] = 9;
        break;
      case 9:
        gameState[gsRoundValue] = 12;
        break;
    }
  }

  String getNextRoundValue() {
    switch (gameState[gsRoundValue]) {
      case 1:
        return 'Truco';
      case 3:
        return 'Seis';
      case 6:
        return 'Nove';
      case 9:
        return 'Doze';
      default:
        return 'Truco';
    }
  }
}
