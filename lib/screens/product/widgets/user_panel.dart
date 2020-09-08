import 'package:flutter/material.dart';
import 'package:xlo/models/ad.dart';

class UserPanel extends StatelessWidget {
  UserPanel(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
          child: Text(
            'Anunciante',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Emilson',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Na OLX desde hoje',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
