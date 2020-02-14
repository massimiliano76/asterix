import 'package:asterix/redux/store/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBadge extends StatelessWidget {
  final Color mainColor;

  const CartBadge({Key key, this.mainColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store) => store.state.cart.totalProduct,
      builder: (context, num) {
        if (num != 0) {
          return GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
              child: Stack(
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
                    top: ScreenUtil().setWidth(5),
                    right: -ScreenUtil().setWidth(3),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: ScreenUtil().setWidth(11),
                      child: Text(
                        num.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {},
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
