import 'dart:async';
import 'package:awstreams_testapp/src/ui/constant_variables.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final cartStreamController = StreamController.broadcast();

  // The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'products items': [
      {'name': 'Flash Drive', 'price': 20, 'id': 1, 'image': 'images/sdd.jpeg'},
      {'name': 'Keyboard', 'price': 100, 'id': 2, 'image': 'images/sdd.jpeg'},
      {'name': 'Speaker', 'price': 10, 'id': 3, 'image': 'images/sdd.jpeg'},
      {'name': 'USB Cable', 'price': 90, 'id': 4, 'image': 'images/sdd.jpeg'},
      {'name': 'Mouse Pad', 'price': 20, 'id': 5, 'image': 'images/sdd.jpeg'},
      {'name': 'CD', 'price': 100, 'id': 6, 'image': 'images/sdd.jpeg'},
      {'name': 'PC Screen', 'price': 10, 'id': 7, 'image': 'images/sdd.jpeg'},
      {'name': 'Headphones', 'price': 90, 'id': 8, 'image': 'images/sdd.jpeg'},
      {'name': 'Flash Drive', 'price': 20, 'id': 9, 'image': 'images/sdd.jpeg'},
      {
        'name': 'App consultation',
        'price': 100,
        'id': 10,
        'image': 'images/sdd.jpeg'
      },
      {
        'name': 'Logo Design',
        'price': 10,
        'id': 11,
        'image': 'images/sdd.jpeg'
      },
      {'name': 'CD', 'price': 90, 'id': 12, 'image': 'images/sdd.jpeg'},
      {
        'name': 'Flash Drive',
        'price': 20,
        'id': 13,
        'image': 'images/sdd.jpeg'
      },
      {'name': 'PC Screen', 'price': 100, 'id': 14, 'image': 'images/sdd.jpeg'},
      {'name': 'Keyboard', 'price': 10, 'id': 15, 'image': 'images/sdd.jpeg'},
    ],
    'cart items': [
      {'name': 'Keyboard', 'price': 10, 'id': 15, 'image': 'images/sdd.jpeg'},
    ]
  };

  void addToCart(item) {
    //allItems[cProductsItems].remove(item);
    allItems[cCartItems].add(item);
    List<String> myList = item;
    cartStreamController.sink.add(myList);
  }

  void removeFromCart(item) {
    allItems[cCartItems].remove(item);
    allItems[cProductsItems].add(item);
    cartStreamController.sink.add(allItems);
  }

  // The [dispose] method is used
  // to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = ProductBloc();
