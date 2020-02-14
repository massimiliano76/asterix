import 'package:asterix/components/cart_badge.dart';
import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Ingredient.dart';
import 'package:asterix/models/Products/Product.dart';
import 'package:asterix/redux/actions/Cart/cart_actions.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/screens/DetailProductPage/components/single_ingredient.dart';
import 'package:asterix/utils/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

class DetailProductPage extends StatelessWidget {
  final Color mainColor;
  final Product product;

  const DetailProductPage({Key key, this.mainColor, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreConnector<AppState, Store<AppState>>(
        converter: (store) => store,
        builder: (context, store) {
          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                CartBadge(
                  mainColor: mainColor,
                )
              ],
              backgroundColor: mainColor,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: mainColor,
              label: Text("AGGIUNGI AL CARRELLO"),
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                store.dispatch(AddProduct(CartProduct(product)));
                Navigator.pop(context);
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(10),
                      bottom: ScreenUtil().setHeight(10),
                    ),
                    child: Text(
                      product.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                  ),
                  Text(
                    "€ " + product.price.toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                      color: mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20),
                      ),
                      children: <Widget>[
                        Text(
                          "Ingredienti",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(18),
                          ),
                        ),
                        ColumnBuilder(
                          itemCount: product.ingredients.length,
                          itemBuilder: (_, i) {
                            Ingredient ingredient = product.ingredients[i];
                            return SingleIngredient(
                              ingredient: ingredient,
                              isAddon: false,
                              mainColor: mainColor,
                            );
                          },
                        ),
                        //List

                        Text(
                          "Aggiunzioni",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(18),
                          ),
                        ),
                        //List
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
