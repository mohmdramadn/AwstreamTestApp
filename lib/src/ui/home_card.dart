import 'package:awstreams_testapp/src/ui/product_screen.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        child: GestureDetector(
          onTap: (){
            setState(() {
              Navigator.pushNamed(context, ProductScreen.pageId);
            });
          },
          child: Card(
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(Icons.wb_incandescent),
                  title: Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
