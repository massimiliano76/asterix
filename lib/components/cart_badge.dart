import 'package:asterix/models/Products/Cart.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/screens/CartPage/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBadge extends StatelessWidget {
  final bool isCategory;
  final Color mainColor;

  const CartBadge({Key key, this.isCategory = false, @required this.mainColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Cart>(
      converter: (store) => store.state.cart,
      builder: (context, cart) {
        if (cart.totalProduct != 0) {
          return Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
            child: GestureDetector(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      cart.totalPrice.toStringAsFixed(2) + " €",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: ScreenUtil().setWidth(35),
                        ),
                      ),
                      Positioned(
                        top: isCategory
                            ? -ScreenUtil().setWidth(5)
                            : ScreenUtil().setWidth(5),
                        right: -ScreenUtil().setWidth(3),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: ScreenUtil().setWidth(11),
                          child: Text(
                            cart.totalProduct.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartPage(
                      prevSbColor: mainColor,
                    ),
                  ),
                );
              },
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
