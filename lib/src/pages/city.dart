import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';

class CityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void backButtonAction(pageContext) {
    Navigator.pop(pageContext);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context).settings.arguments;
    //print('$cityData');

    final double statusBarHeigth = MediaQuery.of(context).padding.top;

    print('${cityData["name"]}');

    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
            key: _scaffoldKey,
            drawer: CustomDrawer(pageContext: context),
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                // Container(
                //   height: 250,
                //   decoration: BoxDecoration(color: Colors.amber),
                //   child: Image.network(cityData["places"][0]["img"]),
                // ),

                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 250,
                  right: 0,
                  child: Image.network(
                    cityData["places"][0]["img"],
                    fit: BoxFit.cover,
                  ),
                ),

                /*No wireframe do design, faz sentido o icone de voltar nese local,
                porém a ação de clique não funciona, pois nossa ListView está sobreposto a este componente.
                Basta inverter aqui no código a ordem dos componentes que tudo funciona.
                O layout ficará a mesma coisa.*/

                /*---- Hint ---------
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        cityData['name'],
                                        style: TextStyle(
                                          fontFamily: 'Helvetica Neue',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.blue[600],
                                          size: 15,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Text(
                                            '4.2',
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(15),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.red[300],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: statusBarHeigth),
                  //decoration: BoxDecoration(color: Colors.greenAccent),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      backButtonAction(context);
                    },
                  ),
                ),
              ],
            )));
  }
}
