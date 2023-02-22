// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_app1/model/item.dart';

class cart with ChangeNotifier {
  List selectedproudct = [];
  double price = 0;
  add(Items proudct) {
    selectedproudct.add(proudct);
    price += proudct.price.round();
    notifyListeners();
  }

  delete(Items proudct) {
    selectedproudct.remove(proudct);
    price -= proudct.price.round();
    notifyListeners();
  }
}
