import 'package:awstreams_testapp/src/ui/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'home_card.dart';
import 'package:awstreams_testapp/src/ui/user_account_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String pageId = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(children: [
        DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bk5.jpeg"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeCard(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        iconSize: 40,
                        icon: Icon(Icons.person),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(
                                context, UserAccountScreen.pageId);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Card(
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        iconSize: 40,
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(
                                context, ShoppingCartScreen.pageId);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
