import 'card_model.dart';

enum Team {
  team1,
  team2,
}

class PlayerModel {
  final String name;
  final bool isHuman;
  final Team team;
  List<CardModel> cards;

  PlayerModel(
      {required this.name,
      this.isHuman = false,
      this.cards = const [],
      required this.team});

  void addCards(List<CardModel> newCards) {
    cards = [...cards, ...newCards];
  }

  void removeCard(CardModel card) {
    cards.removeWhere((c) => c == card);
  }

  bool get isBot => !isHuman;
}
