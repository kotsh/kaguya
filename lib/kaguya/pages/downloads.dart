import 'package:flutter/material.dart';

class DownloadsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // center the children
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.file_download,
            size: 160.0,
          ),
          Text(
            "Third Tab",
          )
        ],
      ),
    );
  }
}
