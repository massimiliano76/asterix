import 'dart:io';

import 'package:asterix/components/cart_badge.dart';
import 'package:asterix/components/custom_safe_area.dart';
import 'package:asterix/models/Products/Category.dart';
import 'package:asterix/models/Products/Product.dart';
import 'package:asterix/network/CategoryPage/category_network.dart';
import 'package:asterix/screens/CategoryPage/components/single_category.dart';
import 'package:asterix/utils/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatefulWidget {
  final Color prevColor;

  const CategoryPage({Key key, this.prevColor}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Future<Map<String, List<Product>>> products;

  @override
  void initState() {
    super.initState();
    setStatusBarColorGreen();
    products = getProducts();
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(widget.prevColor);
  }

  Future<Map<String, List<Product>>> getProducts() async {
    Map<String, List<Product>> list = await CategoryNetwork.getProducts();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(
          title: "Pizze Classiche",
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
        title: "Antipasti",
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
        title: "Pizze con Bufala",
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

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              height: ScreenUtil().setHeight(230),
            ),
            FutureBuilder(
              future: products,
              builder: (_, AsyncSnapshot<Map<String, List<Product>>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return Align(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Align(
                        child: Text(snapshot.error.toString()),
                      );
                    }

                    return Container(
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
                              products: snapshot.data[model.title],
                            ),
                          );
                        },
                      ),
                    );

                  default:
                    return SizedBox.shrink();
                }
              },
            ),
            Positioned(
              top: ScreenUtil().setHeight(30),
              left: ScreenUtil().setWidth(20),
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Platform.isAndroid
                              ? Icons.arrow_back
                              : Icons.arrow_back_ios,
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
                          fontSize: ScreenUtil().setSp(24),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  CartBadge(
                    isCategory: true,
                    mainColor: Theme.of(context).accentColor,
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
