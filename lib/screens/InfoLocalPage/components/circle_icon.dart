import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIcon extends StatelessWidget {
  CircleIcon({this.icon, this.backgroundColor});

  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        child: CircleAvatar(
          child: Icon(
            icon,
            color: Colors.white,
            size: ScreenUtil().setWidth(30),
          ),
          radius: ScreenUtil().setWidth(30),
          backgroundColor: Colors.transparent,
        ),
        onTap: () {},
      ),
    );
  }
}
