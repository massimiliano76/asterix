import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutScaffold extends StatefulWidget {
  final List<Widget> children;

  LayoutScaffold({Key key, this.children});

  _LayoutScaffoldState createState() => _LayoutScaffoldState();
}

class _LayoutScaffoldState extends State<LayoutScaffold> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        key: scaffoldKey,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: widget.children,
              ),
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
          ],
        ),
      ),
    );
  }
}
