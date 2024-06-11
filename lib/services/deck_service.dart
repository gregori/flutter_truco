import 'package:flutter_truco/constants.dart';
import 'package:flutter_truco/models/deck_model.dart';
import 'package:flutter_truco/models/draw_model.dart';
import 'package:flutter_truco/services/api_service.dart';

class DeckService {
  static const baseUrl = 'https://deckofcardsapi.com/api';
  final ApiService _apiService;

  DeckService() : _apiService = ApiService(baseUrl: baseUrl);

  Future<DeckModel> newDeck([int deckCount = 1]) async {
    final data = await _apiService.get(
      '/deck/new/shuffle?cards=${trucoCards.join(',')}',
      params: {'deck_count': deckCount},
    );

    return DeckModel.fromJson(data);
  }

  Future<DrawModel> drawCards(DeckModel deck, {int count = 1}) async {
    final data = await _apiService.get(
      '/deck/${deck.deckId}/draw',
      params: {'count': count},
    );

    deck.remaining = data['remaining'];

    return DrawModel.fromJson(data);
  }
}
