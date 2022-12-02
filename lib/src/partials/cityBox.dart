import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  CityBox({@required this.data, this.onTap});

  final data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return (Container(
        margin: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            onTap(data);
          },
          child: Stack(children: <Widget>[
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  data['places'][0]['img'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 10,
              left: 0,
              child: Text(
                data['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ]),
        )));
  }
}
