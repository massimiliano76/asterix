import 'dart:math' as math;
import 'package:asterix/screens/CategoryPage/category_page.dart';
import 'package:asterix/screens/DetailPage/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleCategory extends StatelessWidget {
  final CategoryModel categoryModel;

  SingleCategory({this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(15),
        ),
        height: ScreenUtil().setHeight(160),
        decoration: BoxDecoration(
          gradient: categoryModel.backgroundColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: ScreenUtil().setHeight(20),
              left: ScreenUtil().setWidth(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    categoryModel.title,
                    style: TextStyle(
                      color: Color(0xDDf5f5f5),
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(18),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Text(
                    categoryModel.subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(21),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: ScreenUtil().setWidth(categoryModel.rightImage ?? 40),
              bottom: ScreenUtil().setHeight(categoryModel.bottomImage ?? 20),
              child: Hero(
                tag: categoryModel.url,
                child: Transform(
                  alignment: Alignment.center,
                  transform:
                      Matrix4.rotationY(categoryModel.rotate ? math.pi : 0),
                  child: Image.network(
                    categoryModel.url,
                    width:
                        ScreenUtil().setWidth(categoryModel.widthImage ?? 140),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              url: categoryModel.url,
              gradient: categoryModel.backgroundColor,
              rotate: categoryModel.rotate,
              sbColor: categoryModel.mainColor,
            ),
          ),
        );
      },
    );
  }
}
