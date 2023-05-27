import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'medicine.dart';
class cart with ChangeNotifier{
  List<medicine>items=[];
  double price=0.0;
  void add(medicine item){
    items.add(item);
    price +=item.price;
    notifyListeners();
  }
  int get count{
    return items.length;
  }
  double get totalprice{
    return price;
  }
  List<medicine>get basketitem{
    return items;
  }
  void remove(medicine item){
    items.remove(item);
    price -=item.price;
    notifyListeners();
  }

}