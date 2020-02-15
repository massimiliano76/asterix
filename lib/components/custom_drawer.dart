import 'package:asterix/components/drawer_item.dart';
import 'package:asterix/screens/CategoryPage/category_page.dart';
import 'package:asterix/screens/HomePage/home_page.dart';
import 'package:asterix/screens/InfoLocalPage/info_local_page.dart';
import 'package:asterix/screens/LoginPage/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  final String selected;

  CustomDrawer({Key key, this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(350),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'Paninoteca Asterix',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: ScreenUtil().setSp(26),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
            ),
            DrawerItem(
              selected: selected,
              icon: Icons.home,
              title: "Home",
              page: HomePage(),
            ),
            DrawerItem(
              icon: Icons.fastfood,
              title: "Componi",
              page: CategoryPage(),
            ),
            DrawerItem(
              icon: Icons.local_dining,
              title: "Offerte",
            ),
            DrawerItem(
              icon: Icons.location_on,
              title: "Ristorante",
              page: InfoLocalPage(),
            ),
            DrawerItem(
              icon: Icons.person,
              title: "Il mio account",
              page: LoginPage(),
            ),
            Divider(),
            DrawerItem(
              icon: Icons.info,
              title: "Termini e Condizioni",
            ),
            DrawerItem(
              icon: Icons.info,
              title: "Privacy Policy",
            ),
            DrawerItem(
              icon: Icons.info,
              title: "Ristoranti aderenti all'offerta",
            ),
          ],
        ),
      ),
    );
  }
}
