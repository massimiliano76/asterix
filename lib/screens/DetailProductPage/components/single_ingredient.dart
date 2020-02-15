import 'package:asterix/models/Products/Ingredient.dart';
import 'package:asterix/redux/actions/Product/product_action.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

class SingleIngredient extends StatefulWidget {
  final Ingredient ingredient;
  final bool isAddon;
  final Color mainColor;
  final Store<AppState> store;

  const SingleIngredient(
      {Key key, this.ingredient, this.isAddon, this.mainColor, this.store})
      : super(key: key);

  @override
  _SingleIngredientState createState() => _SingleIngredientState();
}

class _SingleIngredientState extends State<SingleIngredient> {
  Ingredient ingredient;
  bool isAddon;
  bool isPlus;
  Color color;
  IconData icon;
  String text;

  @override
  void initState() {
    super.initState();
    ingredient = widget.ingredient;
    isAddon = isPlus = widget.isAddon;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ingredient.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            isPlus ? Icons.add_circle : Icons.remove_circle,
            color: isPlus ? widget.mainColor : Color(0x88999BA8),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(20),
          ),
          Text(
            isAddon ? ingredient.price.toStringAsFixed(2) + " €" : "0.00 €",
          ),
        ],
      ),
      onTap: () {
        if (isPlus) {
          widget.store.dispatch(
            AddIngredients(ingredient),
          );
          setState(() {
            isPlus = false;
          });
        } else {
          widget.store.dispatch(
            RemoveIngredients(ingredient),
          );
          setState(() {
            isPlus = true;
          });
        }
      },
    );
  }
}
