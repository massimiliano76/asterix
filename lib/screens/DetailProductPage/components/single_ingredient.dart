import 'package:asterix/models/Products/Ingredient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleIngredient extends StatefulWidget {
  final Ingredient ingredient;
  final bool isAddon;
  final Color mainColor;

  const SingleIngredient(
      {Key key, this.ingredient, this.isAddon, this.mainColor})
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
        setState(() {
          isPlus = !isPlus;
        });
      },
    );
  }
}
