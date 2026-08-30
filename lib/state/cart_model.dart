import 'package:flutter/foundation.dart';

import '../models/food_item.dart';

class CartEntry {
  final FoodItem item;
  int quantity;

  CartEntry({required this.item, this.quantity = 1});

  double get total => item.price * quantity;
}

class CartModel extends ChangeNotifier {
  final Map<String, CartEntry> _entries = {};

  List<CartEntry> get entries => _entries.values.toList();

  int get itemCount => _entries.values.fold(0, (sum, e) => sum + e.quantity);

  double get subtotal => _entries.values.fold(0.0, (sum, e) => sum + e.total);

  void add(FoodItem item) {
    if (_entries.containsKey(item.id)) {
      _entries[item.id]!.quantity++;
    } else {
      _entries[item.id] = CartEntry(item: item);
    }
    notifyListeners();
  }

  void remove(String id) {
    _entries.remove(id);
    notifyListeners();
  }

  void decrement(String id) {
    final entry = _entries[id];
    if (entry == null) return;
    if (entry.quantity <= 1) {
      _entries.remove(id);
    } else {
      entry.quantity--;
    }
    notifyListeners();
  }

  bool contains(String id) => _entries.containsKey(id);
}
