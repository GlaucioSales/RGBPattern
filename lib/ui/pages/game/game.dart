import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class Game extends StatelessWidget {
  const Game({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questão: 1"),
      ),
      body: Stack(
        children: [
          Question(),
          Options(),
        ],
      ),
    );
  }
}