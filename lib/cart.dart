import 'package:flutter/cupertino.dart';

class Medicine {
  final String name;
  final double price;

  Medicine({required this.name, required this.price});
}

class Cart with ChangeNotifier {
  List<Medicine> items = [];
  double price = 0.0;

  void addToCart(String name, double price) {
    var item = Medicine(name: name, price: price);

    items.add(item);
    this.price += item.price;

    notifyListeners();
  }
  int get count{
    return items.length;
  }
  List<Medicine>get basketitem{
    return items;
  }
  void remove(Medicine item){
    items.remove(item);
    price -=item.price;
    notifyListeners();
  }
  double get totalprice{
    return price;
  }

}
