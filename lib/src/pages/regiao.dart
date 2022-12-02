import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';
import '../partials/cityBox.dart';

class RegionPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void verCidadesAction(context, continentIndex) {
    print(continentIndex);
    Navigator.pushNamed(context, '/listCity', arguments: continentIndex);
  }

  void cityBoxAction(cityData) {
    print(cityData['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
            key: _scaffoldKey,
            appBar: CustomAppBar(
              scaffoldKey: _scaffoldKey,
              pageContext: context,
              title: 'Escolha uma região',
            ),
            drawer: CustomDrawer(pageContext: context),
            backgroundColor: Colors.white,
            body: ListView.builder(
              itemCount: appdata.data.length,
              itemBuilder: (context, index) {
                var cidades = [];
                for (var country in appdata.data[index]['countries']) {
                  cidades.addAll(country['cities']);
                }

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "${appdata.data[index]['name']} ( ${cidades.length} )",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica Neue'),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            verCidadesAction(context, index);
                          },
                          child: Text(
                            'Ver cidades',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cidades.length,
                          itemBuilder: (cityContext, cityIndex) {
                            return CityBox(
                                data: cidades[cityIndex], onTap: cityBoxAction);
                          }),
                    ),
                  ],
                );
              },
            )));
  }
}
