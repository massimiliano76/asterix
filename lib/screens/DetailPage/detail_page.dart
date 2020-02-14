import 'dart:math' as math;
import 'package:asterix/utils/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatefulWidget {
  final String url;
  final Gradient gradient;
  final Color sbColor;
  final bool rotate;

  const DetailPage(
      {Key key, this.url, this.gradient, this.rotate, this.sbColor})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    setStatusBarColor(widget.sbColor);
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColorGreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              pinned: true,
              backgroundColor: widget.sbColor,
              expandedHeight: ScreenUtil().setHeight(300),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    //opacity: top == 80.0 ? 1.0 : 0.0,
                    opacity: 1.0,
                  ),
                  background: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setWidth(20),
                    ),
                    height: ScreenUtil().setHeight(300),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: widget.gradient,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: widget.url,
                      child: Transform(
                        alignment: Alignment.center,
                        transform:
                            Matrix4.rotationY(widget.rotate ? math.pi : 0),
                        child: Image.network(
                          widget.url,
                          width: ScreenUtil().setWidth(10),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  50,
                  (i) => Padding(
                    padding: EdgeInsets.only(
                        top: i == 0 ? ScreenUtil().setHeight(20) : 0),
                    child: ListTile(
                      isThreeLine: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(30),
                        vertical: ScreenUtil().setHeight(3),
                      ),
                      title: Text(
                        "Crudo e Bufala",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(19),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Prosciutto Crudo, Mozzarella Di Bufala",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(17),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(5)),
                          Text(
                            "€ 8,00",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                              color: widget.sbColor,
                            ),
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.add_circle,
                        color: widget.sbColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
