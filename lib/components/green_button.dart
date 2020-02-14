import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreenButton extends StatelessWidget {
  final String label;
  final Function onTap;

  GreenButton({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(17),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: Theme.of(context).accentColor,
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onTap,
    );
  }
}
