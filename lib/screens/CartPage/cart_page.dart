import 'package:asterix/models/Products/Cart.dart';
import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Product.dart';
import 'package:asterix/redux/actions/Product/product_action.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/utils/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
      child: Scaffold(
        appBar: AppBar(
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
        body: StoreConnector<AppState, Store<AppState>>(
          converter: (store) => store,
          builder: (_, store) {
            List<CartProduct> products = store.state.cart.products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, int i) {
                CartProduct cartProduct = products[i];
                Product product = cartProduct.product;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(product.name),
                          Text(cartProduct.finalPrice.toStringAsFixed(2) + "€ ")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          Text(product.description),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(Icons.add),
                                onTap: () {
                                  store.dispatch(
                                    IncrementCartQuantity(cartProduct),
                                  );
                                },
                              ),
                              Text(cartProduct.quantity.toString()),
                              GestureDetector(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  store.dispatch(
                                    DecrementCartQuantity(cartProduct),
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
