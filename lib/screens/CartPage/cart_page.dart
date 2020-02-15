import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Product.dart';
import 'package:asterix/redux/actions/Product/product_action.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/screens/CartPage/components/circle_button.dart';
import 'package:asterix/screens/CategoryPage/category_page.dart';
import 'package:asterix/utils/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

class CartPage extends StatefulWidget {
  final Color prevSbColor;

  const CartPage({Key key, this.prevSbColor}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    setStatusBarColorGreen();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    setStatusBarColor(widget.prevSbColor);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreConnector<AppState, Store<AppState>>(
        converter: (store) => store,
        builder: (_, store) {
          List<CartProduct> products = store.state.cart.products;
          bool isCartEmpty = store.state.cart.totalProduct == 0;
          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    right: ScreenUtil().setWidth(15),
                  ),
                  child: Center(
                    child: Text(
                      store.state.cart.totalPrice.toStringAsFixed(2) + " €",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                  ),
                )
              ],
              title: Text(
                "Carrello",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Theme.of(context).accentColor,
            ),
            floatingActionButton: Builder(
              builder: (context) {
                if (!isCartEmpty) {
                  FloatingActionButton.extended(
                    label: Text("EFFETTUA ACQUISTO"),
                    icon: Icon(
                      Icons.fastfood,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  );
                }

                return SizedBox.shrink();
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Builder(
              builder: (context) {
                if (isCartEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Non hai ancora aggiunto nulla al carrello",
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        OutlineButton(
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                          ),
                          highlightedBorderColor: Theme.of(context).accentColor,
                          highlightColor: Color(0x11949494),
                          child: Text(
                            "Vai ai prodotti",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CategoryPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(80),
                  ),
                  itemCount: products.length,
                  itemBuilder: (_, int i) {
                    CartProduct cartProduct = products[i];
                    Product product = cartProduct.product;
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(15),
                      ),
                      margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(8),
                        right: ScreenUtil().setWidth(8),
                        top: ScreenUtil().setWidth(15),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xAAFFFFFF), Colors.white],
                          tileMode: TileMode.repeated,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x11FFFFFF),
                            blurRadius: 10.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  product.name,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(5),
                                ),
                                Text(
                                  cartProduct.finalPrice.toStringAsFixed(2) +
                                      "€ ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    color: Theme.of(context).accentColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  cartProduct.ingredientsText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    CircleButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      onTap: () {
                                        store.dispatch(
                                          IncrementCartQuantity(cartProduct),
                                        );
                                      },
                                    ),
                                    Text(cartProduct.quantity.toString()),
                                    CircleButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      onTap: () {
                                        store.dispatch(
                                          DecrementCartQuantity(cartProduct),
                                        );
                                        if (store.state.cart.totalProduct ==
                                            0) {
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
