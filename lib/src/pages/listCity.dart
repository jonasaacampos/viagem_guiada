import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customAppBar.dart';
import '../partials/customDrawer.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final continentIndex = ModalRoute.of(context).settings.arguments;
    //print('ARGS: $args');

    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title:
              '${appdata.data[continentIndex]['name']} (${appdata.data[continentIndex]['name'].length})',
          showBack: true,
        ),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: Center(
          child: Text('test...'),
        ),
      ),
    );
  }
}
