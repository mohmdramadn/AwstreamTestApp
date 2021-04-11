import 'package:flutter/material.dart';

class CustomizedCard extends StatelessWidget {
  final String productImage,productName;
  final int productPrice;
  final Function onShoppingCartPressed;

  CustomizedCard(this.productImage, this.productName, this.productPrice,
      this.onShoppingCartPressed);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage(productName),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            productName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            productPrice.toString(),
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: onShoppingCartPressed,
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
