import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viagem_guiada/src/pages/search.dart';

import 'src/models/appdata.dart';

import 'src/pages/preload.dart';
import 'src/pages/home.dart';
import 'src/pages/search.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => AppData())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
        '/preload': (context) => PreLoadPage(),
        '/search': (context) => SearchPage(),
      },
      initialRoute: '/preload',
    );
  }
}
