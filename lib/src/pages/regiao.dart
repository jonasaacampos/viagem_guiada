import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';
import '../partials/cityBox.dart';

class RegionPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
              //Text('Região: ${appdata.data[index]['regiao']}'),
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
                        TextButton(
                          onPressed: () {},
                          // child: Text("${appdata.data[index]['regiao']} ( ${appdata.data[index]['cidades'].length} )"),
                          child: Text(
                              "${appdata.data[index]['name']} ( ${cidades.length} )"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Ver cidades'),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      height: 130,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cidades.length,
                          itemBuilder: (cityContext, cityIndex) {
                            return CityBox(
                                data: cidades[cityIndex], onTap: () {});
                          }),
                    ),
                  ],
                );
              },
            )));
  }
}
