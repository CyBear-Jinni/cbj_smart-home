import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(FontAwesomeIcons.cog,
                color: Theme.of(context).textTheme.body1.color),
            onPressed: () => Navigator.push(context, MaterialPageRoute()),
          ),
        ),
        Text(
          'Actions History',
          style: TextStyle(
              fontSize: 23.0,
              color: Theme.of(context).textTheme.body1.color,
              decoration: TextDecoration.underline),
        ),
        Container(
          height: 20,
        ),
        Text("Empty history")
      ],
    );
  }
}
