import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/screen/componets/provider/internet_provider.dart';
import 'package:web_app/screen/home/provider/home_provider.dart';
import 'package:web_app/screen/home/view/home_screen.dart';
import 'package:web_app/screen/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()),
        ChangeNotifierProvider.value(value: InternetProvider()..checkInternet())
      ],
      child: MaterialApp(
        routes: app_routes,
      ),
    ),
  );
}
