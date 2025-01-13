import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class GameScreen extends StatelessWidget {
  final String difficulty;

  GameScreen({required this.difficulty});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    // קביעת פרמטרים לפי רמת הקושי
    int rows, cols, cardCount;
    switch (difficulty) {
      case 'Easy':
        rows = 2;
        cols = 3;
        cardCount = rows * cols; // 6 קלפים
        break;
      case 'Casual':
        rows = 3;
        cols = 4;
        cardCount = rows * cols; // 12 קלפים
        break;
      case 'Hard':
        rows = 4;
        cols = 4;
        cardCount = rows * cols; // 16 קלפים
        break;
      default:
        rows = 3;
        cols = 4;
        cardCount = rows * cols; // ברירת מחדל: 12 קלפים
    }

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
                            ? Colors.green
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: gameProvider.flippedCards[row * cols + col]
                            ? Text(
                                '${row * cols + col}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(''),
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
