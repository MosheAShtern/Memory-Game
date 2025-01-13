import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
  appBar: AppBar(title: Text('Game')),
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (int row = 0; row < 3; row++) // 3 שורות
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int col = 0; col < 4; col++) // 4 עמודות בכל שורה
              GestureDetector(
                onTap: () {
                  int index = row * 4 + col; // חישוב האינדקס של הקלף
                  gameProvider.flipCard(index);
                },
                child: Container(
                  margin: EdgeInsets.all(8), // רווח בין הקלפים
                  width: 100, // רוחב הקלף
                  height: 100, // גובה הקלף
                  decoration: BoxDecoration(
                    color: gameProvider.flippedCards[row * 4 + col]
                        ? Colors.green
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: gameProvider.flippedCards[row * 4 + col]
                        ? Text(
                            '${row * 4 + col}', // מספר הקלף (לדוגמה)
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
