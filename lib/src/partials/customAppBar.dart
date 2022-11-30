import 'package:flutter/material.dart';

Widget CustomAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title: Text(
      'AppBar personalizado',
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'),
    ),
    leading: IconButton(
        onPressed: null,
        icon: Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        )),
    actions: <Widget>[
      IconButton(
          onPressed: null,
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ))
    ],
  );
}
