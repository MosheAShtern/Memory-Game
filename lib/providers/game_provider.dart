import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  late List<bool> flippedCards; // מצב קלפים

  void initializeGame(int cardCount) {
    flippedCards = List.generate(cardCount, (index) => false);
    notifyListeners(); // לעדכן את ה-UI
  }

  void flipCard(int index) {
    flippedCards[index] = !flippedCards[index];
    notifyListeners();
  }

  void resetGame() {
    for (int i = 0; i < flippedCards.length; i++) {
      flippedCards[i] = false;
    }
    notifyListeners();
  }
}
