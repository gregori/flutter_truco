import 'package:flutter_truco/models/card_model.dart';
import 'package:flutter/material.dart';

class _SuitOption {
  final Suit value;
  final Color color;
  final String label;

  _SuitOption({required this.value})
      : color = CardModel.suitToColor(value),
        label = CardModel.suitToUnicode(value);
}

class SuitChooserModal extends StatelessWidget {
  const SuitChooserModal({super.key});

  @override
  Widget build(BuildContext context) {
    final suits = [
      _SuitOption(value: Suit.clubs),
      _SuitOption(value: Suit.hearts),
      _SuitOption(value: Suit.spades),
      _SuitOption(value: Suit.diamonds),
    ];
    return AlertDialog(
      title: const Text('Choose a suit'),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: suits
            .map(
              (suit) => TextButton(
                onPressed: () {
                  Navigator.of(context).pop(suit.value);
                },
                child: Text(
                  suit.label,
                  style: TextStyle(color: suit.color, fontSize: 15),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
