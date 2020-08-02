import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusWidth = MediaQuery.of(context).padding.top;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Pokedex",
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(height: statusWidth),
                      Container(
                        height: 110,
                        margin: EdgeInsets.only(top: 15.0, right: 5.0),
                        child: Column(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.menu), onPressed: () {})
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
