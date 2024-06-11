import 'package:flutter/material.dart';
import 'package:flutter_truco/constants.dart';

enum Suit {
  hearts,
  clubs,
  diamonds,
  spades,
  other,
}

class CardModel implements Comparable {
  final String image;
  final Suit suit;
  final String faceValue;
  late int value;

  CardModel(
      {required this.image, required this.suit, required this.faceValue}) {
    value = _faceValueToValue();
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      image: json['image'],
      faceValue: json['value'],
      suit: _stringToSuit(json['suit']),
    );
  }

  int _faceValueToValue() {
    return cardValues.indexOf(faceValue) + 1;
  }

  static Suit _stringToSuit(String suit) {
    suit = suit.toLowerCase();
    return Suit.values.firstWhere(
      (e) => e.toString() == 'Suit.$suit',
      orElse: () => Suit.other,
    );
  }

  static String suitToString(Suit suit) {
    switch (suit) {
      case Suit.hearts:
        return 'Hearts';
      case Suit.clubs:
        return 'Clubs';
      case Suit.diamonds:
        return 'Diamonds';
      case Suit.spades:
        return 'Spades';
      default:
        return 'Other';
    }
  }

  static String suitToUnicode(Suit suit) {
    switch (suit) {
      case Suit.hearts:
        return '\u2665';
      case Suit.clubs:
        return '\u2663';
      case Suit.diamonds:
        return '\u2666';
      case Suit.spades:
        return '\u2660';
      default:
        return 'Other';
    }
  }

  static Color suitToColor(Suit suit) {
    switch (suit) {
      case Suit.hearts:
      case Suit.diamonds:
        return Colors.red;
      case Suit.clubs:
      case Suit.spades:
      default:
        return Colors.black;
    }
  }

  @override
  String toString() {
    return 'CardModel(image: $image, suit: $suit, value: $faceValue)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CardModel && value == other.value;

  bool operator >(Object other) {
    if (other is CardModel) {
      return value > other.value;
    }
    return false;
  }

  @override
  int get hashCode => suit.hashCode ^ faceValue.hashCode;

  @override
  int compareTo(other) {
    return value.compareTo(other.value);
  }
}
