import 'package:deliveryapp/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:deliveryapp/src/routes/pages.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: primaryColor,
        primaryColor: primaryColor,
        accentColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: FontStyles.textTheme,
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: primaryColor,
          textTheme: CupertinoTextThemeData(
            textStyle: FontStyles.normal,
          ),
        ),
      ),
      initialRoute: Pages.initial,
      routes: Pages.routes,
    );
  }
}
