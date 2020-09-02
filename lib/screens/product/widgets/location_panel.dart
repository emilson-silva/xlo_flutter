import 'package:flutter/material.dart';
import 'package:xlo/models/ad.dart';

class LocationPanel extends StatelessWidget {
  LocationPanel(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
          child: Text(
            'Localização',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text('CEP'),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text('Munícipio'),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text('Bairro'),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${ad.address.postalCode}'),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text('${ad.address.city}'),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text('${ad.address.district}'),
                    SizedBox(
                      height: 12.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
