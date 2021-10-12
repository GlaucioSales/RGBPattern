import 'package:flutter/material.dart';
import 'package:rgb_pattern/ui/pages/game/game.dart';

class Home extends StatelessWidget {
  const Home({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget> [
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/popcorn.png',
                width: 275,
              ),
              Text('RGB pattern',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    fixedSize: Size.fromWidth(200),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Game()),
                  );
                },
                child: Text('Novo jogo'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    fixedSize: Size.fromWidth(200),
                ),
                onPressed: () { },
                child: Text('Continuar jogo'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  fixedSize: Size.fromWidth(200),
                ),
                onPressed: () { },
                child: Text('Histórico'),
              ),
            ]
          )
        )
      ),
    );
  }
}