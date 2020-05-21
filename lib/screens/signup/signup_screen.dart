import 'package:flutter/material.dart';
import 'package:xlo/screens/signup/widgets/field_Title.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Cadastrar'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          children: <Widget>[
            FieldTitle(
              title: 'Apelido',
              subtitle: 'Como aparecerá em seus anúncios',
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Exemplo: João S.',
              ),
              validator: (text){
                if(text.length <6)
                  return 'Apelido muito curto';
                return null;
              },
            ),
            FieldTitle(
              title: 'E-mail',
              subtitle: 'Enviaremos um e-mail de confirmação',
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (text){
                if(text.length <6 || !text.contains('@'))
                  return 'E-mail inválido';
                return null;
              },
            ),
            FieldTitle(
              title: 'Senha',
              subtitle: 'Use Letras, números e caracteres especiais',
            ),
          ],
        ),
      ),
    );
  }
}
