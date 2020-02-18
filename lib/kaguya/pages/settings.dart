import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // center the children
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.settings,
            size: 160.0,
          ),
          Text(
            "Fourth Tab",
          )
        ],
      ),
    );
  }
}
