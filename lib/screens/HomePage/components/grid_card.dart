import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridCard extends StatelessWidget {
  final bool isLong;

  GridCard({this.isLong});

  @override
  Widget build(BuildContext context) {
    int heightOne = 6;
    int heightTwo = isLong ? 5 : 4;
    return Card(
      elevation: 2.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: heightOne,
            child: Image.network(
              "https://www.mcdonalds.it/themes/mcd/build/images/share_fb_1200x630.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: heightTwo,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Accedi ad un mondo di offerte",
                    style: Theme.of(context).textTheme.title,
                  ),
                  isLong
                      ? Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin volutpat consequat bibendum",
                          style: Theme.of(context).textTheme.subtitle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(16),
                              ),
                        )
                      : Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: Theme.of(context).textTheme.subtitle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(16),
                              ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
