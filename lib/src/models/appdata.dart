import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    final res = await http.get(
        'https://raw.githubusercontent.com/jonasaacampos/viagem_guiada/master/lib/data/data-api.json');

    if (res.statusCode == 200) {
      //obter dados...
      //setData(res.body);
      // ignore: avoid_print
      print(res.body);
      return true;
    }
  }
}
