import 'package:flutter/material.dart';

class GameCard {
  final IconData icon;
  final Color color;
  //bool isFlipped;

  GameCard({required this.icon, required this.color, /* this.isFlipped = false */});
}

List<GameCard> getCards() {
  return [
    GameCard(icon: Icons.circle, color: Colors.red), // עיגול אדום
    GameCard(icon: Icons.crop_square, color: Colors.blue), // ריבוע כחול
    GameCard(icon: Icons.star, color: Colors.green), // כוכב ירוק
    GameCard(icon: Icons.change_history, color: Colors.yellow), // משולש צהוב
    GameCard(icon: Icons.diamond, color: Colors.orange), // יהלום כתום
    GameCard(icon: Icons.hexagon, color: Colors.purple), // משושה סגול
    GameCard(icon: Icons.pentagon, color: Colors.brown), // מחומש חום
    GameCard(icon: Icons.stop, color: Colors.pink), // מתומן ורוד
  ];
}