import 'package:flutter/material.dart';

class LineSeparation extends StatelessWidget {
  const LineSeparation({
    Key key,
    this.margin,
  }) : super(key: key);

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
