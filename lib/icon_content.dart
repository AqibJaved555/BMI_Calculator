import 'package:flutter/material.dart';
import 'constant.dart';

class IconContent extends StatelessWidget {
  IconContent({this.label, this.icon});

  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(label, style: labelTextStyle),
      ],
    );
  }
}
