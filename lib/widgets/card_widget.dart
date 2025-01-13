import 'package:flutter/material.dart';
 

//this is the state less apliction
class FlipCard extends StatelessWidget {
  const FlipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FlipCard1(),
        ),
        ),
      );
    
  }
}

//this is front card
class Card extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final String text;
  const Card({
    super.key,
    required this.color,
    required this.width,
    required this.height,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    
    return  Container(
      
            width: width,
            height: height,
            color: color,
            child: Center(child: Text(text, style: TextStyle(fontSize: 30, color: Colors.white), 
             )),
            );
  }
}

//this is the back card
class BackgroundCard
 extends StatelessWidget {
  final String text;
  const BackgroundCard
  ({super.key,
  required this.text,});

  @override
  Widget build(BuildContext context) {
    return   Card(color: Color.fromARGB(255, 33, 243, 89),width: 200,height: 200,text: text);
  }
}


//this is a variables
const FrontCard = Card(color: Colors.blue,width: 200,height: 200,text: '?',);
const BackCard = BackgroundCard(text: '!',);

class FlipCard1 extends StatefulWidget {
  const FlipCard1({super.key});

  @override
  State<FlipCard1> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard1> {
  bool isFront = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      setState(() {
        print(isFront);
        isFront = !isFront;
        });
    }, child: isFront ? FrontCard : BackCard);
  }
}
 