import 'package:flutter/material.dart';
import 'package:web_app/screen/home/view/home_screen.dart';
import 'package:web_app/screen/web/view/web_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreen(),
  "web":(context) => WebScreen(),
};
