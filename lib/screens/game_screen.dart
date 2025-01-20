import 'package:flutter/material.dart';
import 'package:memory_game/models/card_model.dart';
import 'package:memory_game/utils/card_.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class GameScreen extends StatelessWidget {
  final String difficulty;

  GameScreen({required this.difficulty});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    // קביעת פרמטרים לפי רמת הקושי
    int rows, cols, cardCount, numberOfCards;
    switch (difficulty) {
      case 'Easy':
        rows = 2;
        cols = 3;
        cardCount = rows * cols; // 6 קלפים
        numberOfCards = 3;
        break;
      case 'Casual':
        rows = 3;
        cols = 4;
        cardCount = rows * cols; // 12 קלפים
        numberOfCards = 6;
        break;
      case 'Hard':
        rows = 4;
        cols = 4;
        cardCount = rows * cols; // 16 קלפים
        numberOfCards = 8;
        break;
      default:
        rows = 3;
        cols = 4;
        cardCount = rows * cols; // ברירת מחדל: 12 קלפים
        numberOfCards = 6;
    }

    List<GameCard> cards = getRandomCards(numberOfCards); 

    // אתחול מצב המשחק (רק פעם אחת)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gameProvider.initializeGame(cardCount);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('$difficulty Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int row = 0; row < rows; row++) // יצירת שורות
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int col = 0; col < cols; col++) // יצירת עמודות
                  GestureDetector(
                    onTap: () {
                      int index = row * cols + col; // חישוב אינדקס
                      gameProvider.flipCard(index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(8), // רווח בין קלפים
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: gameProvider.flippedCards[row * cols + col]
                            ? cards.removeAt(0).color
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
