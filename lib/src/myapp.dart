import 'package:awstreams_testapp/src/ui/product_screen.dart';
import 'package:awstreams_testapp/src/ui/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:awstreams_testapp/src/ui/home_screen.dart';
import 'package:awstreams_testapp/src/ui/user_account_screen.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(

        accentColor: Colors.blue,
        cardColor: Color(0xff474747).withOpacity(0.3),
        //scaffoldBackgroundColor: Color(0xffB6B6B6).withOpacity(0.4),
        iconTheme: IconThemeData(
          opacity: 1,
          color: Color(0xff405C9A),
        ),
      ),
      initialRoute: HomeScreen.pageId,
      routes: {
        ProductScreen.pageId: (context) => ProductScreen(),
        HomeScreen.pageId: (context) => HomeScreen(),
        UserAccountScreen.pageId: (context) => UserAccountScreen(),
        ShoppingCartScreen.pageId: (context) => ShoppingCartScreen(),
      },
    );
  }
}
