import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Product.dart';
import 'package:asterix/redux/actions/Product/product_action.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

import 'circle_button.dart';

class ProductCart extends StatelessWidget {
  final Product product;
  final CartProduct cartProduct;
  final Store<AppState> store;

  const ProductCart({Key key, this.product, this.cartProduct, this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  cartProduct.finalPrice.toStringAsFixed(2) + "€ ",
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleButton(
                      icon: Icon(
                        Icons.remove,
                        color: Theme.of(context).accentColor,
                      ),
                      onTap: () {
                        store.dispatch(
                          DecrementCartQuantity(cartProduct),
                        );
                        if (store.state.cart.totalProduct == 0) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                    Text(cartProduct.quantity.toString()),
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
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
