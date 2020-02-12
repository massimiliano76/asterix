import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/screens/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

//TODO: to remove
AppState counterReducer(AppState state, dynamic action) {
  return state;
}

void main() {
  Store<AppState> store = new Store<AppState>(
    counterReducer,
    initialState: AppState(),
  );
  runApp(Asterix(store: store));
}

class Asterix extends StatefulWidget {
  Asterix({this.store});

  final Store<AppState> store;

  @override
  _AsterixState createState() => _AsterixState();
}

class _AsterixState extends State<Asterix> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFFFB818),
          accentColor: Color(0xFF394B00),
          cardColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xFF707070),
          ),
          textTheme: TextTheme(
            title: TextStyle(
              color: Color(0xFF212115),
            ),
            subtitle: TextStyle(
              color: Color(0xFF949494),
            ),
          ),
        ),
        home: Builder(
          builder: (context) {
            Size size = MediaQuery.of(context).size;

            ScreenUtil.init(context, width: size.width, height: size.height);

            return HomePage();
          },
        ),
      ),
    );
  }
}