import 'package:asterix/components/cart_badge.dart';
import 'package:asterix/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutScaffold extends StatefulWidget {
  final List<Widget> children;
  final String selected;

  LayoutScaffold({Key key, this.children, this.selected});

  _LayoutScaffoldState createState() => _LayoutScaffoldState();
}

class _LayoutScaffoldState extends State<LayoutScaffold> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      key: scaffoldKey,
      drawer: CustomDrawer(
        selected: widget.selected,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: widget.children,
            ),
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: ScreenUtil().setWidth(30),
                ),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            ),
            Positioned(
              right: 10,
              top: 20,
              child: CartBadge(
                mainColor: Theme.of(context).primaryColor,
                isCategory: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
