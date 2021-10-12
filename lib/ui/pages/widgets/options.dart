import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(width: 500),
          SizedBox(
            height: 400,
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue,
              fixedSize: Size.fromWidth(200),
            ),
            onPressed: () { },
            child: Text('Opção 1'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue,
              fixedSize: Size.fromWidth(200),
            ),
            onPressed: () { },
            child: Text('Opção 2'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue,
              fixedSize: Size.fromWidth(200),
            ),
            onPressed: () { },
            child: Text('Opção 3'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue,
              fixedSize: Size.fromWidth(200),
            ),
            onPressed: () { },
            child: Text('Opção 4'),
          ),
        ]
    );
  }
}