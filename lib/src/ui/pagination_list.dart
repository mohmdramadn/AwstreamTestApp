import 'package:awstreams_testapp/src/ui/product_card.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';

class ProductPagination extends StatefulWidget {
  @override
  _ProductPaginationState createState() => _ProductPaginationState();
}

class _ProductPaginationState extends State<ProductPagination> {
  int page;
  PaginationViewType paginationViewType;
  GlobalKey<PaginationViewState> key;

  @override
  void initState() {
    page = -1;
    paginationViewType = PaginationViewType.gridView;
    key = GlobalKey<PaginationViewState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaginationView<String>(
      key: key,
      preloadedItems: <String>[
        Text('testing pagination').toStringShort(),
      ],
      paginationViewType: paginationViewType,
      itemBuilder: (BuildContext context, dynamic txt, int index) => GridTile(
        child: ProductCard(
        ),
      ),
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
    final List<String> upcomingList = List.generate(
      15,
      (int index) => Text('data').toStringShort(),
    );
    await Future<List<String>>.delayed(
      Duration(milliseconds: 1500),
    );
    return page == 5 ? [] : upcomingList;
  }
}
