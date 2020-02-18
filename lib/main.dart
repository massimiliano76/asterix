import 'package:asterix/models/Local/DataWrapper.dart';
import 'package:asterix/network/CategoryPage/category_network.dart';
import 'package:asterix/redux/actions/Local/local_action.dart';
import 'package:asterix/redux/reducers/index.dart';
import 'package:asterix/redux/store/AppState.dart';
import 'package:asterix/screens/HomePage/home_page.dart';
import 'package:asterix/utils/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
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
  Future<DataWrapper> local;

  @override
  void initState() {
    super.initState();
    local = getData();
    setSBTextColor(true);
  }

  Future<DataWrapper> getData() async {
    DataWrapper newData = await CategoryNetwork.getAddons();
    return newData;
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
        home: FutureBuilder(
          future: local,
          builder: (context, AsyncSnapshot<DataWrapper> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Size size = MediaQuery.of(context).size;
              ScreenUtil.init(context, width: size.width, height: size.height);
              widget.store.dispatch(SaveInfo(snapshot.data));

              return HomePage();
            }

            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
