import 'package:flutter/material.dart';
import 'package:xlo/helpers/format_field.dart';
import 'package:xlo/models/ad.dart';

class MainPanel extends StatelessWidget {
  const MainPanel(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: 24.0,
            bottom: 14.0,
          ),
          child: Text(
            'R\$${numToString(ad.price)}',
            style: TextStyle(
              fontSize: 34.0,
              letterSpacing: 2.8,
              fontWeight: FontWeight.w300,
              color: Colors.grey[800],
            ),
          ),
        ),
        Text(
          ad.title,
          style: TextStyle(
            fontSize: 18.0,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 18.0),
          child: Text(
            'Publicado em ${dateToString(ad.dateCreated)}',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600]),
          ),
        )
      ],
    );
  }
}
