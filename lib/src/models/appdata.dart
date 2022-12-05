import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  var favorites = [];

  bool isFavorite(cityName) {
    return favorites.contains(cityName);
  }

  bool favorite(cityName) {
    if (isFavorite(cityName)) {
      favorites.remove(cityName);
      return false;
    } else {
      favorites.add(cityName);
      return true;
    }
  }

  // static const urlJsonApi = 'https://raw.githubusercontent.com/jonasaacampos/viagem_guiada/master/lib/data/data-api.json';
  static const urlJsonApi = 'https://api.b7web.com.br/flutter1wb';

//https://api.b7web.com.br/flutter1wb
//https://raw.githubusercontent.com/jonasaacampos/viagem_guiada/master/lib/data/data-api.json

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  // ignore: missing_return
  Future<bool> requestData() async {
    final res = await http.get(urlJsonApi);

    if (res.statusCode == 200) {
      setData(jsonDecode(res.body));
      return true;
    } else {
      return false;
    }
  }
}
