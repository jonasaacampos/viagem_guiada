import 'package:flutter/material.dart';

Widget CustomAppBar(
    {String title = '', bool hideSearch = false, bool showBack = false}) {
  IconButton drawerIcon = IconButton(
      onPressed: null,
      icon: Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      ));

  IconButton backIcon = IconButton(
      onPressed: null,
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30,
      ));

  IconButton leadingButton = drawerIcon;

  if (showBack) {
    leadingButton = backIcon;
  }

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: true,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'),
    ),
    leading: leadingButton,
    actions: <Widget>[
      !hideSearch
          ? IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ))
          : Container(),
    ],
  );
}
