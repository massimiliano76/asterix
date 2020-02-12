import 'dart:math';

import 'package:asterix/components/layout_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      children: <Widget>[
        Placeholder(
          fallbackHeight: ScreenUtil().setHeight(250),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Text(
          "Impossibile resistere",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.title.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setHeight(23),
              ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        Text(
          "Vivi al meglio McDonald's.\nScopri tutti i nostri prodotti preparati con pollo e\ncarne bovina 100% italiana",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.title.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: ScreenUtil().setHeight(17),
              ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        GestureDetector(
          child: Text(
            ">>>",
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          onTap: () {
            print(">>> Pressed");
          },
        ),
        SizedBox(
          height: ScreenUtil().setHeight(40),
        ),
        StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 8,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(
              13,
            ),
          ),
          itemBuilder: (BuildContext context, int index) => new Container(
            color: Colors.green,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('$index'),
              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 4 : 3),
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
        )
      ],
    );
  }
}
