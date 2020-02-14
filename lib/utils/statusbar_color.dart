import 'dart:ui' show Color;

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

setStatusBarColorGreen() async {
  await FlutterStatusbarcolor.setStatusBarColor(
    Color(0xFF007625),
    animate: true,
  );
}

setStatusBarColorYellow() async {
  await FlutterStatusbarcolor.setStatusBarColor(
    Color(0xFFFFB818),
    animate: true,
  );
}

setStatusBarColor(Color color) async {
  await FlutterStatusbarcolor.setStatusBarColor(
    color,
    animate: true,
  );
}
