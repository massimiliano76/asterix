import 'dart:io';

import 'package:flutter/material.dart';

class CustomSafeArea extends StatelessWidget {
  final Widget child;

  const CustomSafeArea({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: Platform.isIOS ? false : true,
      right: Platform.isIOS ? false : true,
      bottom: Platform.isIOS ? false : true,
      maintainBottomViewPadding: Platform.isIOS ? true : false,
      child: child,
    );
  }
}
