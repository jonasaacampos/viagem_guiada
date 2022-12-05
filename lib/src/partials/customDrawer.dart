import 'package:flutter/material.dart';
import '../../main.dart';

Widget CustomDrawer({
  BuildContext pageContext,
}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyApp.appName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue'),
              ),
              Text(
                MyApp.appVersion,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Helvetica Neue'),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 4, 121, 255),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/home');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.public,
            color: Colors.black,
          ),
          title: Text('Escolher Região'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/regiao');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.black,
          ),
          title: Text('Buscar Cidade'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/search');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          title: Text('Cidades Salvas'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/favorites');
          },
        ),
      ],
    ),
  );
}
