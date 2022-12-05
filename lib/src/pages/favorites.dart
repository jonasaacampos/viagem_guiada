import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';
import '../partials/cityBox.dart';

class FavoritesPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  static const appName = 'Viagem Guiada';
  static const appSlogan = 'Destinos reais baseados em\nhistórias imaginadas';

  TextStyle styleTextHome = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      List favorites = appdata.favoritesCities();
      // ignore: avoid_print
      print(favorites);

      return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Locais Salvos',
        ),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: GridView.count(
            crossAxisCount: 2,
            //shrinkWrap: true,
            children: List.generate(favorites.length, ((index) {
              return CityBox(
                  data: favorites[index],
                  onTap: (cityData) {
                    Navigator.pushNamed(context, '/city', arguments: cityData);
                  });
            }))),
      );
    });
  }
}
