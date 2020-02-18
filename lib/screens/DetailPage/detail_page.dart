import 'dart:math' as math;
import 'package:asterix/components/cart_badge.dart';
import 'package:asterix/components/custom_safe_area.dart';
import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Product.dart';
import 'package:asterix/redux/actions/Cart/cart_actions.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/screens/DetailProductPage/detail_product_page.dart';
import 'package:asterix/utils/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

class DetailPage extends StatefulWidget {
  final String url;
  final Gradient gradient;
  final Color sbColor;
  final bool rotate;
  final List<Product> products;

  const DetailPage({
    Key key,
    this.url,
    this.gradient,
    this.rotate,
    this.sbColor,
    this.products,
  }) : super(key: key);

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
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              actions: <Widget>[
                CartBadge(
                  mainColor: widget.sbColor,
                ),
              ],
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
            StoreConnector<AppState, Store<AppState>>(
              converter: (store) => store,
              builder: (context, store) {
                return SliverList(
                  delegate: SliverChildListDelegate(
                      widget.products.map((Product product) {
                    return ListTile(
                      isThreeLine: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(30),
                        vertical: ScreenUtil().setHeight(3),
                      ),
                      title: Text(
                        product.name,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.description,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(5)),
                          Text(
                            "€ " + product.price.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(17),
                              color: widget.sbColor,
                            ),
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.add_circle,
                        color: widget.sbColor,
                      ),
                      onTap: () {
                        store.dispatch(
                          SelectProduct(
                            CartProduct(product),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailProductPage(
                              mainColor: widget.sbColor,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
