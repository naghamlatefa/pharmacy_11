import 'package:flutter/cupertino.dart';

class Medicine {
  final String id;
  final String name;
  final double price;
  final double amount;

  Medicine({required this.id,required this.name, required this.price,required this.amount});
}

class Cart with ChangeNotifier {
  List<Medicine> items = [];
  double price = 0.0;

  void addToCart(String id,String name, double price,double amount) {
    var item = Medicine(id : id,name: name, price: price,amount:amount);

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
