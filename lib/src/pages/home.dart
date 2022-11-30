import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class HomePage extends StatelessWidget {
  static const appName = 'Viagem Guiada';
  static const appSlogan = 'Destinos reais baseados em\nhistórias imaginadas';

  TextStyle styleTextHome = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              appBar: AppBar(title: Text('Home')),
              body: Center(
                  heightFactor: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Bem vind@ ao $appName',
                          style: styleTextHome,
                        ),
                      ),
                      Image.asset(
                        'lib/assets/logo.png',
                        width: 500,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          '$appSlogan',
                          textAlign: TextAlign.center,
                          style: styleTextHome,
                        ),
                      )
                    ],
                  )),
            ));
  }
}
