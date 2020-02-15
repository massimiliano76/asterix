import 'package:asterix/models/Local/DataWrapper.dart';
import 'package:asterix/network/CategoryPage/category_network.dart';
import 'package:asterix/redux/actions/Local/local_action.dart';
import 'package:asterix/redux/reducers/index.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/screens/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

void main() async {
  await DotEnv().load('.env');
  Store<AppState> store = new Store<AppState>(
    reducers,
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
  void initState() {
    super.initState();
    saveData();
  }

  Future saveData() async {
    DataWrapper newData = await CategoryNetwork.getAddons();
    widget.store.dispatch(SaveInfo(newData));
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          primaryColor: Color(0xFFFFB818),
          accentColor: Color(0xFF007625),
          cardColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xFF707070),
          ),
          textTheme: TextTheme(
            body1: TextStyle(
              color: Color(0xFF7F7E7F),
            ),
            title: TextStyle(
              color: Color(0xFF212115),
            ),
            subtitle: TextStyle(
              color: Color(0xFF949494),
            ),
            headline: TextStyle(
              color: Color(0xFF707070),
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
