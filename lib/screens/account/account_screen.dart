import 'package:flutter/material.dart';
import 'package:xlo/common/custom_drawer/custom_drawer.dart';
import 'package:xlo/screens/editAccount/edit_account_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Minha Conta',
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('EDITAR'),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditAccountScreen()));
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
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
            title: Text(
              'Meus anúncios',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Favoritos',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
