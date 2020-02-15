import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String selected;
  final Widget page;

  DrawerItem({Key key, this.icon, this.title, this.selected, this.page});

  Widget build(BuildContext context) {
    final isSelected = selected == title;
    return Container(
      color: isSelected ? Colors.grey.shade300 : Colors.transparent,
      child: ListTileTheme(
        style: ListTileStyle.drawer,
        selectedColor: Theme.of(context).accentColor,
        child: ListTile(
          selected: isSelected,
          leading: Icon(
            icon,
            size: ScreenUtil().setWidth(35),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            page != null
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => page,
                    ),
                  )
                : Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
