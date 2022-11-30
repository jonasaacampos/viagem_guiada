import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';

class SearchPage extends StatelessWidget {
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
              body: Center(
                  heightFactor: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text('Página de busca')],
                  )),
            ));
  }
}
