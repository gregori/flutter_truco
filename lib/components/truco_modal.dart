import 'package:flutter/material.dart';
import 'package:flutter_truco/models/player_model.dart';

class _TrucoOption {
  final String label;
  final int value;
  final Color color;

  _TrucoOption({required this.label, required this.value, required this.color});
}

class SuitChooserModal extends StatelessWidget {
  const SuitChooserModal(
      {super.key, required this.roundValue, required this.challenger});

  final int roundValue;
  final PlayerModel challenger;

  @override
  Widget build(BuildContext context) {
    final raiseStrings = {
      1: 'Truco',
      3: 'Seis',
      6: 'Nove',
      9: 'Doze',
    };

    return AlertDialog(
      title: Text('$challenger pediu ${raiseStrings[roundValue]}!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: _getTrucoOptions()
            .map((e) => TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(e.value);
                  },
                  child: Text(
                    e.label,
                    style: TextStyle(color: e.color, fontSize: 15),
                  ),
                ))
            .toList(),
      ),
    );
  }

  List<_TrucoOption> _getTrucoOptions() {
    var options = [
      _TrucoOption(label: 'Correr', value: 0, color: Colors.red),
      _TrucoOption(label: 'Aceitar', value: 1, color: Colors.green),
    ];

    if (roundValue == 1) {
      options.add(_TrucoOption(label: 'Seis', value: 6, color: Colors.green));
    } else if (roundValue == 3) {
      options.add(_TrucoOption(label: 'Nove', value: 9, color: Colors.green));
    } else if (roundValue == 6) {
      options.add(_TrucoOption(label: 'Doze', value: 12, color: Colors.green));
    }

    return options;
  }
}
