import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 25, 20, 25),
      child: Text('Fusce vulputate, ex sit amet dignissim auctor, lorem risus pretium eros, non consequat mauris ligula sit amet lacus. Fusce quis mi sed purus scelerisque hendrerit eget in nisi. Suspendisse iaculis dolor quis blandit gravida. Donec feugiat felis vel elementum malesuada. Morbi feugiat dui et purus malesuada sollicitudin?',
        style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}