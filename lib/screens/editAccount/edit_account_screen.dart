import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/models/user.dart';
import 'package:xlo/screens/editAccount/widget/user_type_widget.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final User _user = User();

  @override
  Widget build(BuildContext context) {
    InputDecoration _buildDecoration(String label) {
      return InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.only(
          left: 16.0,
          bottom: 8.0,
          top: 8.0,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Editar Conta'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          UserTypeWidget(
            initialValue: _user.userType,
            onSaved: (userType) {},
          ),
          TextFormField(
            initialValue: _user.name,
            decoration: _buildDecoration('Nome *'),
            validator: (name) {
              if (name.length < 6) return 'Nome inválido';
              return null;
            },
            onSaved: (name) {},
          ),
          TextFormField(
            initialValue: _user.phone,
            decoration: _buildDecoration('Telefone *'),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              TelefoneInputFormatter(),
            ],
            validator: (name) {
              if (name.length < 15) return 'Telefone inválido';
              return null;
            },
            onSaved: (phone) {},
          ),
          TextFormField(
            obscureText: true,
            decoration: _buildDecoration('Nova senha'),
            validator: (pass) {
              if (pass.isEmpty) return null;
              if (pass.length < 6) return 'Senha muito curta';
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: _buildDecoration('Repita nova senha'),
            validator: (pass) {
              if (pass.isEmpty) return null;
              if (pass.length < 6) return 'Senha muito curta';
              return null;
            },
            autovalidate: true,
          )
        ],
      ),
    );
  }
}
