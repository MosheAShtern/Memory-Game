import 'package:flutter/material.dart';
import 'game_screen.dart';

class SelectionScreen extends StatelessWidget {
  final String name;

  SelectionScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome, $name!')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'בחר רמת קושי:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(difficulty: 'Easy'),
                  ),
                );
              },
              child: Text('קל'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(difficulty: 'Medium'),
                  ),
                );
              },
              child: Text('בינוני'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(difficulty: 'Hard'),
                  ),
                );
              },
              child: Text('קשה'),
            ),
          ],
        ),
      ),
    );
  }
}
