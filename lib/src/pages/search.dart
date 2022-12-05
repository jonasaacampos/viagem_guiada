import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';
import '../partials/cityBox.dart';

class SearchPage extends StatelessWidget {
  var listaResultadoBusca = [];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Busque seu destino',
          hideSearch: true,
        ),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Digite o nome da cidade',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
          ),
          GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(
                listaResultadoBusca.length,
                ((index) {
                  return CityBox(
                    data: listaResultadoBusca[index],
                    onTap: (cityData) {
                      // ignore: avoid_print
                      print(cityData['name']);
                    },
                  );
                }),
              )),
        ]),
      ),
    );
  }
}
