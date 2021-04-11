import 'package:awstreams_testapp/src/ui/product_card.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  static final String pageId = 'product';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bk8.jpeg"), fit: BoxFit.fill),
          ),
          child: ProductCard(),
        ),
      ),
    );
  }
}
