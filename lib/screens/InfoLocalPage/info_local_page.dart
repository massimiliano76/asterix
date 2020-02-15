import 'package:asterix/components/line_separation.dart';
import 'package:asterix/models/Local/LocalInfo.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/circle_icon.dart';
import 'components/row_table.dart';

class InfoLocalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentDay = DateTime.now().weekday;

    sendEmail(String userEmail) async {
      final String email = 'mailto:$userEmail';
      if (await canLaunch(email)) {
        await launch(email);
      } else {
        throw 'Could not launch $email';
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Ristorante",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(
            ScreenUtil().setHeight(20),
          ),
          child: StoreConnector<AppState, LocalInfo>(
            converter: (store) => store.state.localInfo,
            builder: (context, info) => Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Paninoteca Asterix',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: ScreenUtil().setSp(28),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setWidth(5),
                      ),
                      LineSeparation(
                        margin: EdgeInsets.only(
                          right: ScreenUtil().setWidth(200),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setWidth(10),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    info.city,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      info.email,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    onTap: () => sendEmail(info.email),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                info.address,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Orari',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                        ),
                      ),
                      SizedBox(height: 2),
                      RowTable(
                        day: 'Lunedì',
                        currentDay: currentDay,
                        weekDay: 1,
                        hourAm: info.times.monday.openHour,
                        hourPm: info.times.monday.closeHour,
                      ),
                      RowTable(
                        day: 'Martedì',
                        currentDay: currentDay,
                        weekDay: 2,
                        hourAm: info.times.tuesday.openHour,
                        hourPm: info.times.tuesday.closeHour,
                      ),
                      RowTable(
                        day: 'Mercoledì',
                        currentDay: currentDay,
                        weekDay: 3,
                        hourAm: info.times.wednesday.openHour,
                        hourPm: info.times.wednesday.closeHour,
                      ),
                      RowTable(
                        day: 'Giovedì',
                        currentDay: currentDay,
                        weekDay: 4,
                        hourAm: info.times.thursday.openHour,
                        hourPm: info.times.thursday.closeHour,
                      ),
                      RowTable(
                        day: 'Venerdì',
                        currentDay: currentDay,
                        weekDay: 5,
                        hourAm: info.times.friday.openHour,
                        hourPm: info.times.friday.closeHour,
                      ),
                      RowTable(
                        day: 'Sabato',
                        currentDay: currentDay,
                        weekDay: 6,
                        hourAm: info.times.saturday.openHour,
                        hourPm: info.times.saturday.closeHour,
                      ),
                      RowTable(
                        day: 'Domenica',
                        currentDay: currentDay,
                        weekDay: 7,
                        hourAm: info.times.sunday.openHour,
                        hourPm: info.times.sunday.closeHour,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleIcon(
                          icon: Icons.call,
                          backgroundColor: Colors.cyan,
                        ),
                        CircleIcon(
                          icon: Icons.map,
                          backgroundColor: Colors.green,
                        ),
                        CircleIcon(
                          icon: CommunityMaterialIcons.facebook,
                          backgroundColor: Color(0xFF4b5bff),
                        ),
                        CircleIcon(
                          icon: CommunityMaterialIcons.instagram,
                          backgroundColor: Color(0xFFff1744),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
