import 'package:flutter_truco/components/game_board.dart';
import 'package:flutter_truco/components/new_game_button.dart';
import 'package:flutter_truco/providers/truco_game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final TrucoGameProvider _provider;

  @override
  void initState() {
    // não é necessário escutar por alterações
    _provider = Provider.of<TrucoGameProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Card Game',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          NewGameButton(provider: _provider),
        ],
      ),
      body: const GameBoard(),
    );
  }
}
