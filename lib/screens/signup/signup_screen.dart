import 'package:flutter/material.dart';
import 'package:xlo/blocs/signup_bloc.dart';
import 'package:xlo/screens/signup/widgets/field_Title.dart';
import 'package:xlo/screens/signup/widgets/password_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignUpBloc _signUpBloc;

  @override
  void initState() {
    super.initState();
    _signUpBloc = SignUpBloc();
  }

  @override
  void dispose() {
    _signUpBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Cadastrar'),
      ),
      body: Form(
        key: _formKey,
        child: StreamBuilder<SignUpBlocState>(
            stream: _signUpBloc.outState,
            builder: (context, snapshot) {
              return ListView(
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
                    validator: (text) {
                      if (text.length < 6) return 'Apelido muito curto';
                      return null;
                    },
                    onSaved: _signUpBloc.setName,
                    enabled: snapshot.data.state != SignUpState.LOADING,
                  ),
                  SizedBox(height: 26.0),
                  FieldTitle(
                    title: 'E-mail',
                    subtitle: 'Enviaremos um e-mail de confirmação',
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (text) {
                      if (text.length < 6 || !text.contains('@'))
                        return 'E-mail inválido';
                      return null;
                    },
                    onSaved: _signUpBloc.setEmail,
                    enabled: snapshot.data.state != SignUpState.LOADING,
                  ),
                  SizedBox(height: 26.0),
                  FieldTitle(
                    title: 'Senha',
                    subtitle: 'Use Letras, números e caracteres especiais',
                  ),
                  PasswordField(
                    onSaved: _signUpBloc.setPassword,
                    enabled: snapshot.data.state != SignUpState.LOADING,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24.0),
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.pink,
                      disabledColor: Colors.pink.withAlpha(150),
                      child: snapshot.data.state == SignUpState.LOADING
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text(
                              'Cadastre-se',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      onPressed: snapshot.data.state != SignUpState.LOADING
                          ? _signUp
                          : null,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Já tem uma conta?',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                                fontSize: 16.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _signUpBloc.signUp();
    }
  }
}
