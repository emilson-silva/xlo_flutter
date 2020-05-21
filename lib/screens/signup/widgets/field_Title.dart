import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FieldTitle extends StatelessWidget {
  FieldTitle({this.title, this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '$title    ',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$subtitle',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}
