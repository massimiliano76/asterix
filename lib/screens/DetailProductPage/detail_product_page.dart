import 'package:asterix/components/cart_badge.dart';
import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Ingredient.dart';
import 'package:asterix/redux/actions/Cart/cart_actions.dart';
import 'package:asterix/redux/actions/Product/product_action.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/screens/DetailProductPage/components/single_ingredient.dart';
import 'package:asterix/utils/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

class DetailProductPage extends StatelessWidget {
  final Color mainColor;

  const DetailProductPage({Key key, this.mainColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreConnector<AppState, Store<AppState>>(
        converter: (store) => store,
        builder: (context, store) {
          List<Ingredient> addons = store.state.addons;
          CartProduct product = store.state.currentlySelected;
          int quantity = store.state.currentlySelected.quantity;
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
                store.dispatch(AddProduct(product));
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
                    product.product.name,
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
                      product.product.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                  ),
                  Text(
                    "€ " + product.finalPrice.toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                      color: mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(20),
                        right: ScreenUtil().setWidth(20),
                        bottom: ScreenUtil().setWidth(70),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.remove,
                                  color: mainColor,
                                  size: ScreenUtil().setWidth(35),
                                ),
                                onTap: () {
                                  store.dispatch(DecrementQuantity());
                                },
                              ),
                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                ),
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.add,
                                  color: mainColor,
                                  size: ScreenUtil().setWidth(35),
                                ),
                                onTap: () {
                                  store.dispatch(IncrementQuantity());
                                },
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Ingredienti",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                        ColumnBuilder(
                          itemCount: product.product.ingredients.length,
                          itemBuilder: (_, int i) {
                            Ingredient ingredient =
                                product.product.ingredients[i];
                            return SingleIngredient(
                              ingredient: ingredient,
                              isAddon: false,
                              mainColor: mainColor,
                              store: store,
                            );
                          },
                        ),
                        //List

                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),

                        Text(
                          "Aggiunzioni",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                        ColumnBuilder(
                          itemCount: addons.length,
                          itemBuilder: (_, i) {
                            Ingredient ingredient = addons[i];
                            try {
                              product.product.ingredients.firstWhere(
                                (el) => el.isEqual(
                                  ingredient,
                                ),
                              );
                              return SizedBox.shrink();
                            } catch (e) {
                              return SingleIngredient(
                                ingredient: ingredient,
                                isAddon: true,
                                mainColor: mainColor,
                                store: store,
                              );
                            }
                          },
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
