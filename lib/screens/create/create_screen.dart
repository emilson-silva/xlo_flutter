import 'package:flutter/material.dart';
import 'package:xlo/common/custom_drawer/custom_drawer.dart';
import 'package:xlo/screens/create/widget/images_field.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Inserir Anúncio'),
      ),
      drawer: CustomDrawer(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            ImagesField(
              onSaved: (images) {},
              initialValue: [],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Título *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              validator: (text) {
                if (text.isEmpty) return 'Campo obrigatório';
                return null;
              },
              onSaved: (t) {},
            ),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Descrição *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
                contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              validator: (text){
                if(text.trim().isEmpty) return 'Campo obrigatório';
                if(text.trim().length < 10)
                  return 'Descrição muito curta';
                return null;
              },
              onSaved: (d){

              },
            ),
            Container(
              height: 50.0,
              child: RaisedButton(
                color: Colors.pink,
                child: Text(
                  'Enviar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
