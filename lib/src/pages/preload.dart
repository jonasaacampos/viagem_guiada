import 'dart:ui';

import 'package:flutter/material.dart';

class PreLoadPage extends StatefulWidget {
  @override
  _PreLoadPage createState() => _PreLoadPage();
}

class _PreLoadPage extends State<PreLoadPage> {
  bool loading = false;

  var appName = 'Viagem Guiada';
  var appSlogan = 'Destinos reais baseados em histórias imaginadas';

  var textStyle = TextStyle(fontSize: 16);
  var textStyleTitle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  var textStyleSlogan = TextStyle(fontSize: 18, fontStyle: FontStyle.italic);

  var animationColorGrey = AlwaysStoppedAnimation<Color>(Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/logo.png',
            width: 300,
          ),
          Text(
            appName,
            style: textStyleTitle,
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text(
                appSlogan,
                style: textStyleSlogan,
              ),
            ),
          ),
          loading
              ? Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    'Carregando informações...',
                    style: textStyle,
                  ),
                )
              : Container(),
          loading
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: animationColorGrey,
                )
              : Container(),
          !loading
              ? Container(
                  margin: EdgeInsets.all(20),
                  child: TextButton(
                      child: Text('Clique aqui para entar novamente...'),
                      onPressed: () {}),
                )
              : Container(),
        ],
      )),
    );
  }
}
