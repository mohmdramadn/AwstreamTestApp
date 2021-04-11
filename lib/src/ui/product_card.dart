import 'package:awstreams_testapp/src/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';

import 'constant_variables.dart';

class ProductCard extends StatefulWidget {
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  ProductBloc productBloc = ProductBloc();
  int page;
  PaginationViewType paginationViewType;
  GlobalKey<PaginationViewState> key;

  @override
  void initState() {
    page = 0;
    paginationViewType = PaginationViewType.gridView;
    key = GlobalKey<PaginationViewState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: productBloc.allItems,
      stream: productBloc.getStream,
      builder: (context, snapshot) {
        print(snapshot.data[cProductsItems].length);
        return snapshot.data[cProductsItems].length > 0
            ? paginationShopItemsListBuilder(snapshot)
            : Center(child: Text("All items in shop have been taken"));
      },
    );
  }

  Widget paginationShopItemsListBuilder(snapshot) {
    final shopList = snapshot.data[cProductsItems];
    return PaginationView<String>(
      key: key,
      preloadedItems: <String>[
        Text('testing pagination').toStringShort(),
      ],
      paginationViewType: paginationViewType,
      itemBuilder: (BuildContext context, dynamic txt, int index) {
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
                  image: AssetImage(shopList[index][cImage]),
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
                                shopList[index][cName],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                ('${shopList[index][cPrice].toString()}'),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.add_shopping_cart),
                              onPressed: () {
                                print(snapshot.data[cCartItems]);
                                productBloc.addToCart(shopList[index]);
                                //page++;
                              },
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      pageFetch: pageFetch,
      pullToRefresh: true,
      onError: (dynamic error) => Center(
        child: Text('Some error occured'),
      ),
      onEmpty: Center(
        child: Text('Sorry! This is empty'),
      ),
      bottomLoader: Center(
        child: CircularProgressIndicator(),
      ),
      initialLoader: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<List<String>> pageFetch(int offset) async {
    page++;
    final List<String> upcomingList =
        List.generate(1, (int index) => Text('data').toStringShort());
    await Future<List<String>>.delayed(
      Duration(milliseconds: 1500),
    );
    return page == 15 ? [] : upcomingList;
  }
}
