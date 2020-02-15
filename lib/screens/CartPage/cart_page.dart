import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Product.dart';
import 'package:asterix/redux/actions/Product/product_action.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/screens/CartPage/components/circle_button.dart';
import 'package:asterix/screens/CartPage/components/product_card.dart';
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
                if (isCartEmpty) {
                  return SizedBox.shrink();
                }

                return FloatingActionButton.extended(
                  label: Text("EFFETTUA ACQUISTO"),
                  icon: Icon(
                    Icons.fastfood,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                );
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
                    return ProductCart(
                      store: store,
                      product: product,
                      cartProduct: cartProduct,
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
