import 'package:flutter/material.dart';
import '../../main.dart';

Widget CustomDrawer() {
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
        )
      ],
    ),
  );
}
