import 'card_model.dart';

class DrawModel {
  final int remaining;
  final List<CardModel> cards;

  DrawModel({required this.remaining, this.cards = const []});

  factory DrawModel.fromJson(Map<String, dynamic> json) {
    return DrawModel(
      remaining: json['remaining'],
      cards: json['cards']
          .map<CardModel>((card) => CardModel.fromJson(card))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'DrawModel{remaining: $remaining, cards: $cards}';
  }
}
