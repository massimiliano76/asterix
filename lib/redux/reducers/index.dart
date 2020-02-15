import 'package:asterix/redux/reducers/Cart/cart_reducer.dart';
import 'package:asterix/redux/reducers/Product/product_reducer.dart';
import 'package:redux/redux.dart';

import 'Local/local_reducer.dart';

final reducers = combineReducers([cartReducer, productReducer, localReducer]);
