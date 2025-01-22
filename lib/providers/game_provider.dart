import 'package:flutter/material.dart';

class GameCard {
  final IconData icon;
  final Color color;

  GameCard({required this.icon, required this.color});
}

class GameProvider extends ChangeNotifier {
  late List<bool> flippedCards;
  late List<int> flippedIndices;
  late List<GameCard> cards;
  bool isInitialized = false;

  void initializeGame(int cardCount) {
    // בדיקה שהמשחק לא כבר מאותחל
    if (isInitialized) return;

    flippedCards = List.generate(cardCount, (_) => false);
    flippedIndices = [];
    cards = _generateCards(cardCount);
    isInitialized = true;
    notifyListeners();
  }

  List<GameCard> _generateCards(int cardCount) {
    List<GameCard> allCards = [
      GameCard(icon: Icons.circle, color: Colors.red),
      GameCard(icon: Icons.crop_square, color: Colors.blue),
      GameCard(icon: Icons.star, color: Colors.green),
      GameCard(icon: Icons.change_history, color: Colors.yellow),
      GameCard(icon: Icons.diamond, color: Colors.orange),
      GameCard(icon: Icons.hexagon, color: Colors.purple),
      GameCard(icon: Icons.pentagon, color: Colors.brown),
      GameCard(icon: Icons.stop, color: Colors.pink),
    ];

    List<GameCard> selectedCards = allCards.take(cardCount ~/ 2).toList();
    selectedCards.addAll(List.from(selectedCards));
    selectedCards.shuffle();
    return selectedCards;
  }

  void flipCard(int index) {
    // בדיקה שלא מנסים להפוך יותר מ-2 קלפים או קלף שכבר הפוך
    if (flippedIndices.length >= 2 || flippedCards[index]) return;

    flippedCards[index] = true;
    flippedIndices.add(index);
    notifyListeners();

    if (flippedIndices.length == 2) {
      Future.delayed(const Duration(milliseconds: 800), () {
        _checkMatch();
      });
    }
  }

  void _checkMatch() {
    if (flippedIndices.length == 2) {
      int index1 = flippedIndices[0];
      int index2 = flippedIndices[1];

      if (cards[index1].icon != cards[index2].icon) {
        flippedCards[index1] = false;
        flippedCards[index2] = false;
      }

      flippedIndices.clear();
      notifyListeners();
    }
  }

  void resetGame() {
    isInitialized = false;
    notifyListeners();
  }

  bool isGameComplete() {
    return flippedCards.every((isFlipped) => isFlipped);
  }
}