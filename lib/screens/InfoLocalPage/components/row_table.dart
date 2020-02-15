import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowTable extends StatelessWidget {
  const RowTable({
    Key key,
    this.day,
    this.hourAm,
    this.hourPm,
    this.currentDay,
    this.weekDay,
  }) : super(key: key);

  final String day;
  final String hourAm;
  final String hourPm;
  final int currentDay;
  final int weekDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight:
                    currentDay == weekDay ? FontWeight.bold : FontWeight.w400,
                fontSize: currentDay == weekDay
                    ? ScreenUtil().setSp(18)
                    : ScreenUtil().setSp(18),
              ),
            ),
          ),
          Expanded(
            child: Text(
              hourAm,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight:
                    currentDay == weekDay ? FontWeight.bold : FontWeight.w400,
                fontSize: currentDay == weekDay
                    ? ScreenUtil().setSp(18)
                    : ScreenUtil().setSp(16),
              ),
            ),
          ),
          Expanded(
            child: Text(
              hourPm,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight:
                    currentDay == weekDay ? FontWeight.bold : FontWeight.w400,
                fontSize: currentDay == weekDay
                    ? ScreenUtil().setSp(18)
                    : ScreenUtil().setSp(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
