import 'package:flutter/material.dart';
import 'package:xlo/models/ad.dart';

class DescriptionPanel extends StatefulWidget {
  DescriptionPanel(this.ad);

  final Ad ad;

  @override
  _DescriptionPanelState createState() => _DescriptionPanelState();
}

class _DescriptionPanelState extends State<DescriptionPanel> {
  Ad get ad => widget.ad;

  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: Text(
            'Descrição',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: Text(
            ad.description,
            maxLines: open ? 100 : 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        if (open || ad.description.length < 100)
          SizedBox(
            height: 18.0,
          )
        else
          Align(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              padding: EdgeInsets.zero,
              child: Text(
                'Ver Descrição completa',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.pink),
              ),
              onPressed: () {
                setState(() {
                  open = true;
                });
              },
            ),
          )
      ],
    );
  }
}
