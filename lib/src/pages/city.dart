import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customDrawer.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPage createState() => _CityPage();
}

class _CityPage extends State<CityPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool heart = false;

  void backButtonAction(pageContext) {
    Navigator.pop(pageContext);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context).settings.arguments;
    //print('$cityData');

    final double statusBarHeigth = MediaQuery.of(context).padding.top;
    final double footerHight = MediaQuery.of(context).padding.bottom;

    print('${cityData["name"]}');

    var starRate = double.parse(cityData['review']).floor();

    var stars = [];
    for (var i = 0; i < 5; i++) {
      if (i < starRate) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }

    return Consumer<AppData>(builder: (ctx, appdata, child) {
      print(appdata.isFavorite(cityData['name']));

      heart = appdata.isFavorite(cityData['name']);

      return Scaffold(
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
                            margin: EdgeInsets.all(5),
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
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: stars[0]
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              size: 15),
                                          Icon(Icons.star,
                                              color: stars[1]
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              size: 15),
                                          Icon(Icons.star,
                                              color: stars[2]
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              size: 15),
                                          Icon(Icons.star,
                                              color: stars[3]
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              size: 15),
                                          Icon(Icons.star,
                                              color: stars[4]
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              size: 15),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 7),
                                      child: Text(
                                        cityData['review'],
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                          fontFamily: 'Helvetica Neue',
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          /* Favorite ICON | Favoritos 
                             * funcrion add or remote hear for visualization
                             */

                          Container(
                            margin: EdgeInsets.all(15),
                            child: IconButton(
                              icon: Icon(
                                heart ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red[300],
                              ),
                              onPressed: () {
                                setState(() {
                                  heart = appdata.favorite(cityData['name']);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 0,
                          right: 15,
                          bottom: 15,
                          left: 15,
                        ),
                        child: Text(
                          cityData['description'],
                          style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[600]),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                          top: 10,
                        ),
                        child: Center(
                          child: Text(
                            'Principais pontos turísticos',
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      GridView.count(
                        padding: EdgeInsets.only(bottom: footerHight),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 10 / 11,
                        children:
                            List.generate(cityData['places'].length, (index) {
                          return Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: ClipRRect(
                                      child: Image.network(
                                        cityData['places'][index]['img'],
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    cityData['places'][index]['name'],
                                    style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    'Ponto turístico',
                                    style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
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
        ),
      );
    });
  }
}
