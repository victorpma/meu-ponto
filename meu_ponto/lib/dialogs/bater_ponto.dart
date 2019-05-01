import 'package:flutter/material.dart';

class BaterPonto { 

  information(BuildContext context, String tipoPonto) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Bater Ponto"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Text("CANCELAR"),
                    onPressed: () => null,
                  ),
                  FlatButton(
                    child: Text("REGISTRAR"),
                    onPressed: () => null,
                  )
                ],
              )
            ],
          );
        });
  }


}
