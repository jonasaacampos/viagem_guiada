import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';

class CityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context).settings.arguments;
    //print('$cityData');

    final double statusBarHeigth = MediaQuery.of(context).padding.top;

    print('$cityData["name"]');
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
            key: _scaffoldKey,
            drawer: CustomDrawer(pageContext: context),
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  decoration: BoxDecoration(color: Colors.amber),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: statusBarHeigth),
                  decoration: BoxDecoration(color: Colors.greenAccent),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),

                /*
                O List View utiliza a tela toda. Ao usar este componente com margem,
                após uma imagem, teremos o efeito de rolagem dinâmica.
                */

                ListView(
                  //o ListView possui espaçamentos padrão...
                  padding: EdgeInsets.zero,
                  //o physics aqui serve para retirar a animação bruta do iphone quando rolamos a tela... (efeito de bouncing, puxada na tela)
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 220),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 1000,
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
