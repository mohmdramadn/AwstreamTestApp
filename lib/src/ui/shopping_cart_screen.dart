import 'package:awstreams_testapp/src/bloc/product_bloc.dart';
import 'package:flutter/material.dart';

import 'constant_variables.dart';

class ShoppingCartScreen extends StatelessWidget {
  static final String pageId = 'cart';
  final productBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body:
      //ProductList(),
      StreamBuilder(
        stream: productBloc.getStream,
        initialData: productBloc.allItems,
        builder: (context, snapshot) {
          print(snapshot.data[cCartItems]);
          return snapshot.data[cCartItems].length > 0
              ? checkoutListBuilder(snapshot)
              : Center(child: Text("You haven't taken any item yet"));
        },
      ),
    );
  }

  Widget checkoutListBuilder(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data["cart items"].length,
      itemBuilder: (BuildContext context, i) {
        final cartList = snapshot.data["cart items"];
        return ListTile(
          title: Text(cartList[i]['name']),
          subtitle: Text("\$${cartList[i]['price']}"),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart),
            onPressed: () {
              productBloc.removeFromCart(cartList[i]);
            },
          ),
          onTap: () {},
        );
      },
    );
  }
}
