import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class GameScreen extends StatelessWidget {
  final String difficulty;

  const GameScreen({Key? key, required this.difficulty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, child) {
        // קביעת פרמטרים לפי רמת הקושי
        late int rows, cols, cardCount;
        switch (difficulty) {
          case 'Easy':
            rows = 2;
            cols = 3;
            break;
          case 'Medium':
            rows = 3;
            cols = 4;
            break;
          case 'Hard':
            rows = 4;
            cols = 4;
            break;
          default:
            rows = 3;
            cols = 4;
        }
        cardCount = rows * cols;

        // אתחול המשחק אם צריך
        if (!gameProvider.isInitialized) {
          gameProvider.initializeGame(cardCount);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('$difficulty Game'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  gameProvider.resetGame();
                  gameProvider.initializeGame(cardCount);
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int row = 0; row < rows; row++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int col = 0; col < cols; col++)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                final index = row * cols + col;
                                gameProvider.flipCard(index);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: gameProvider.flippedCards[row * cols + col]
                                      ? gameProvider.cards[row * cols + col].color
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: const Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: gameProvider.flippedCards[row * cols + col]
                                    ? Icon(
                                        gameProvider.cards[row * cols + col].icon,
                                        color: Colors.white,
                                        size: 40,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
