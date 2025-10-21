import 'package:deliveryapp/src/routes/pages.dart';
import 'package:deliveryapp/src/ui/global_controllers/cart_controller.dart';
import 'package:deliveryapp/src/ui/global_controllers/notifications_controller.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartController>(create: (_) => CartController()),
        ChangeNotifierProvider<NotificationsController>(
            create: (_) => NotificationsController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
          primarySwatch: primaryColor,
          primaryColor: primaryColor,
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
      ),
    );
  }
}
