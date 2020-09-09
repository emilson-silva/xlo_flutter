import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Minha Conta',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 180.0,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: Text(
              'Emilson Silva',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          ListTile(
            title: Text('Meus anúncios'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
