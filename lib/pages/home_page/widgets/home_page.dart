import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/pages/home_page/widgets/app_bar_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.7),
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                ConstsApp.blackPokeball,
                height: 240,
                width: 240,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              AppBarHome(),
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text('Pokemon'),
                      ),
                         ListTile(
                        title: Text('Pokemon'),
                      ),
                         ListTile(
                        title: Text('Pokemon'),
                      ),
                         ListTile(
                        title: Text('Pokemon'),
                      ),
                         ListTile(
                        title: Text('Pokemon'),
                      ),
                         ListTile(
                        title: Text('Pokemon'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
