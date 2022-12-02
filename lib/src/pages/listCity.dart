import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';
import '../partials/cityBox.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void cityBoxAction(pageContext, cityData) {
    print(cityData['name']);
    Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    final continentIndex = ModalRoute.of(context).settings.arguments;
    //print('ARGS: $args');

    return Consumer<AppData>(builder: (ctx, appdata, child) {
      var cities = [];

      for (var country in appdata.data[continentIndex]['countries']) {
        cities.addAll(country['cities']);
      }
      return (Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title:
                '${appdata.data[continentIndex]['name']} (${cities.length} destinos)',
            showBack: true,
          ),
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length, (index) {
              return CityBox(
                  data: cities[index],
                  onTap: (cityData) {
                    cityBoxAction(context, cityData);
                  });
            }),
          )));
    });
  }
}
