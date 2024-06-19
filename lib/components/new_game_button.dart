import 'package:flutter_truco/models/player_model.dart';
import 'package:flutter_truco/providers/game_provider.dart';
import 'package:flutter/material.dart';

class NewGameButton extends StatelessWidget {
  const NewGameButton({
    super.key,
    required GameProvider provider,
    this.color = Colors.white,
  }) : _provider = provider;

  final GameProvider _provider;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final players = [
          PlayerModel(name: 'Rodrigo', isHuman: true, team: Team.team1),
          PlayerModel(name: 'Bot', isHuman: false, team: Team.team2),
          PlayerModel(name: 'Bot1', isHuman: false, team: Team.team1),
          PlayerModel(name: 'Bot2', isHuman: false, team: Team.team2),
        ];
        await _provider.newHand(players);
      },
      child: Text(
        'New Game',
        style: TextStyle(color: color),
      ),
    );
  }
}
