import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List<bool> flippedCards = List.generate(12, (index) => false); // 12 קלפים

  void flipCard(int index) {
    flippedCards[index] = !flippedCards[index];
    notifyListeners(); // מעדכן את ה-UI
  }

  void resetGame() {
    flippedCards = List.generate(12, (index) => false);
    notifyListeners();
  }
}
