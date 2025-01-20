import 'package:flutter/material.dart';
import '../utils/card_.dart'; 

class CardModel {
  final IconData icon;
  final Color color;
/*   bool isFlipped;
 */
  CardModel({required this.icon, required this.color, /* this.isFlipped = false */});
}

List<GameCard> getRandomCards(int numberOfCards) {
  List<GameCard> allCards = getCards();
  allCards.shuffle(); 
  return allCards.take(numberOfCards).toList();
}