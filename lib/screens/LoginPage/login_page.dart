import 'package:asterix/components/green_button.dart';
import 'package:asterix/utils/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.white);
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColorYellow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(30),
          vertical: ScreenUtil().setHeight(15),
        ),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(17),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(25),
                    bottom: ScreenUtil().setHeight(20),
                  ),
                  child: Text(
                    "Hai dimenticato la tua password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                GreenButton(
                  onTap: () {},
                  label: "Accedi",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(15),
            ),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lacinia, nisi eu ultricies faucibus, purus felis interdum tortor, quis sollicitudin ipsum nunc at urna. In ipsum odio, tristique cursus convallis eget, efficitur vel diam",
            ),
          ),
          GreenButton(
            onTap: () {},
            label: "Crea un account",
          ),
        ],
      ),
    );
  }
}
