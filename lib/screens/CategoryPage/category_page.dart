import 'package:asterix/screens/CategoryPage/components/single_category.dart';
import 'package:asterix/utils/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryModel {
  final String title;
  final String subtitle;
  final String url;
  final double bottomImage;
  final double rightImage;
  final double widthImage;
  final Gradient backgroundColor;
  final Color mainColor;
  final bool rotate;

  CategoryModel(
      {this.mainColor,
      this.bottomImage,
      this.rightImage,
      this.widthImage,
      this.title,
      this.subtitle,
      this.url,
      this.backgroundColor,
      this.rotate = false});
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    setStatusBarColorGreen();
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColorYellow();
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(
          title: "Inventa",
          subtitle: "Componi il tuo\npanino",
          url:
              "https://rmhcmaine.org/wp-content/uploads/2017/06/static-happy-meal-box.png",
          mainColor: Color(0xFFFF9601),
          backgroundColor: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF9601), Color(0xFFFFCC00)],
            tileMode: TileMode.repeated,
          ),
          rotate: true),
      CategoryModel(
        title: "Assapora",
        subtitle: "Scegli il tuo\nantipasto",
        url:
            "https://www.stickpng.com/assets/images/585ac06b4f6ae202fedf293b.png",
        mainColor: Color(0xFFFF3B32),
        backgroundColor: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFF3B32), Color(0xFFFF7B75)],
          tileMode: TileMode.repeated,
        ),
        widthImage: 175,
        bottomImage: 0,
        rightImage: 30,
        rotate: true,
      ),
      CategoryModel(
        title: "Bevi",
        subtitle: "Scegli la tua\nbibita",
        url:
            "https://m.mcdonalds.co.uk/content/dam/mcdonaldsuk/item/live/mcdonalds-Vanilla-Milkshake-Medium.png",
        mainColor: Color(0xFF017AFF),
        backgroundColor: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF017AFF), Color(0xFF82BEFF)],
          tileMode: TileMode.repeated,
        ),
        widthImage: 165,
        bottomImage: -5,
        rightImage: 30,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              height: ScreenUtil().setHeight(230),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(75)),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (_, i) {
                  CategoryModel model = categories[i];
                  return Padding(
                    padding: EdgeInsets.only(
                      top: i == 0 ? ScreenUtil().setHeight(25) : 0,
                    ),
                    child: SingleCategory(
                      categoryModel: model,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(30),
              left: ScreenUtil().setWidth(20),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: ScreenUtil().setWidth(28),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(25),
                  ),
                  Text(
                    "Categorie",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(26),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
