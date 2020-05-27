import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordField extends StatelessWidget {
  PasswordField({this.onSaved});

  final FormFieldSetter<String> onSaved;

  @override
  Widget build(BuildContext context) {
    Widget _buildBar(int n, String pass) {
      final int level = _calcScore(pass);
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              color: n <= level ? _getColor(level) : Colors.transparent,
              border: n > level ? Border.all(color: Colors.grey) : null),
        ),
      );
    }

    return FormField<String>(
      initialValue: '',
      onSaved: onSaved,
      validator: (text) {
        if (text.isEmpty || _calcScore(text) < 2) return 'Senha inválida';
        return null;
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: state.didChange,
            ),
            if (state.value.isEmpty)
              Container(
                margin: EdgeInsets.only(top: 6.0),
                height: 8.0,
                child: Row(
                  children: <Widget>[
                    _buildBar(0, state.value),
                    _buildBar(1, state.value),
                    _buildBar(2, state.value),
                    _buildBar(3, state.value),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsets.only(top: 6.0, left: 10.0),
              child: state.value.isNotEmpty || state.hasError
                  ? Text(
                      state.value.isNotEmpty
                          ? _getText(_calcScore(state.value))
                          : state.errorText,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: _getColor(_calcScore(state.value)),
                        fontSize: 12.0,
                      ),
                    )
                  : Container(),
            ),
          ],
        );
      },
    );
  }

  int _calcScore(String text) {
    int score = 0;
    if (text.length > 8) score += 1;
    if (text.contains(RegExp(r'[0-9]'))) score += 1;
    if (text.contains(RegExp(r'[A-Z]'))) score += 1;
    return score;
  }

  Color _getColor(int level) {
    switch (level) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.greenAccent;
      case 3:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  String _getText(int level) {
    switch (level) {
      case 0:
        return 'Senha muito fraca';
      case 1:
        return 'Senha razoalvemente fraca';
      case 2:
        return 'Senha Razoalvemente forte';
      case 3:
        return 'Senha forte ';
      default:
        return '';
    }
  }
}
