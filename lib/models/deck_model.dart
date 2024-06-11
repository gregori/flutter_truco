class DeckModel {
  final String deckId;
  bool shuffled;
  int remaining;

  DeckModel({
    required this.deckId,
    required this.shuffled,
    required this.remaining,
  });

  factory DeckModel.fromJson(Map<String, dynamic> json) {
    return DeckModel(
      deckId: json['deck_id'],
      shuffled: json['shuffled'],
      remaining: json['remaining'],
    );
  }

  @override
  String toString() {
    return 'DeckModel(deck_id: $deckId, shuffled: $shuffled, remaining: $remaining)';
  }
}
