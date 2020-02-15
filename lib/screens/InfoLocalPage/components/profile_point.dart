import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class ProfilePoint extends StatelessWidget {
  ProfilePoint({this.leading, this.title, this.subtitle, this.trailing});

  final leading;
  final String title;
  final String subtitle;
  final trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () {},
      leading: Icon(leading),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 3.8,
        ),
      ),
      subtitle: Text(
        'Lorem ipsum dolor sit amet',
        style: TextStyle(
          fontSize: 3.5,
        ),
      ),
      trailing: Icon(
        Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward,
        size: 4,
      ),
    );
  }
}
