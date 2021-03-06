import 'package:asterix/components/layout_scaffold.dart';
import 'package:asterix/screens/HomePage/components/grid_card.dart';
import 'package:asterix/utils/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setStatusBarColorYellow();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      selected: "Home",
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
          width: ScreenUtil().setHeight(200),
          child: Image.asset(
            "assets/sandwich.png",
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(30),
        ),
        Text(
          "Impossibile resistere",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.title.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(21),
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
                fontSize: ScreenUtil().setSp(15),
              ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        GestureDetector(
          child: Text(
            ">>>",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: ScreenUtil().setSp(16),
            ),
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
          itemCount: 7,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(8),
          ),
          itemBuilder: (BuildContext context, int index) => GridCard(
            isLong: index.isOdd,
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isOdd ? 5 : 4),
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 2.0,
        )
      ],
    );
  }
}
