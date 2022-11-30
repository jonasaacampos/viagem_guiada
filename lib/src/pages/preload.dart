import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../pages/home.dart';

class PreLoadPage extends StatefulWidget {
  @override
  _PreLoadPage createState() => _PreLoadPage();
}

class _PreLoadPage extends State<PreLoadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      loading = true;
    });

    // ignore: use_build_context_synchronously
    bool req = await Provider.of<AppData>(context, listen: false).requestData();

    if (req) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');

      //teste do automaticallyImplyLeading: true no appBar
      //caso personalizado, fazer manualmente a exibição dos icones ao inves de usar o método
      //Navigator.pushNamed(context, '/home');
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    requestInfo();
  }

  // static const appName = 'Viagem Guiada';
  // static const appSlogan = 'Destinos reais baseados em histÃ³rias imaginadas';

  var textStyle = TextStyle(fontSize: 16);
  var textStyleTitle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  var textStyleSlogan = TextStyle(fontSize: 18, fontStyle: FontStyle.italic);

  var animationColorGrey =
      AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 69, 252, 13));

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
            HomePage.appName,
            style: textStyleTitle,
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text(
                HomePage.appSlogan,
                style: textStyleSlogan,
                textAlign: TextAlign.center,
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
