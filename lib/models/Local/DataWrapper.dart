import 'package:asterix/models/Local/LocalInfo.dart';
import 'package:asterix/models/Products/Ingredient.dart';

class DataWrapper {
  final LocalInfo localInfo;
  final List<Ingredient> addons;

  DataWrapper(this.localInfo, this.addons);
}
