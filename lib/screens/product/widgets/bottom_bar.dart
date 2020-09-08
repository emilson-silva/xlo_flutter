import 'package:flutter/material.dart';
import 'package:xlo/models/ad.dart';

class BottomBar extends StatelessWidget {
  BottomBar(this.ad);

  Ad ad;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 38.0,
            margin: EdgeInsets.symmetric(horizontal: 26.0),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.all(
                Radius.circular(19),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text(
                        'Ligar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Chat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(249, 249, 249, 1),
              border: Border(
                top: BorderSide(color: Colors.grey[400]),
              ),
            ),
            alignment: Alignment.center,
            height: 38.0,
            child: Text(
              'Emilson (Anunciante)',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
