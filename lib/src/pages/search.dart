import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';
import '../partials/cityBox.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  var listaResultadoBusca = [];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void doSearch(pageContext, text) async {
    var newList =
        await Provider.of<AppData>(pageContext, listen: false).searchCity(text);

    setState(() {
      listaResultadoBusca = newList;
    });
  }

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
                  suffixIcon: Icon(Icons.search, size: 30)),
              onChanged: (text) {
                doSearch(context, text);
              },
            ),
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                //shrinkWrap: true,
                children: List.generate(listaResultadoBusca.length, ((index) {
                  return CityBox(
                      data: listaResultadoBusca[index],
                      onTap: (cityData) {
                        // ignore: avoid_print
                        print(cityData['name']);
                      });
                }))),
          )
        ]),
      ),
    );
  }
}
