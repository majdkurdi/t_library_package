import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';
import '../models/cart_item.dart';
import '../services/books_service.dart';

final cartProvider =
    ChangeNotifierProvider<CartNotifier>((ref) => CartNotifier());

class CartNotifier extends ChangeNotifier {
  List<CartItem> cart = [];
  final _booksService = BooksService();

  // CartNotifier._internal();
  // static CartNotifier? _instance;
  // factory CartNotifier() {
  //   if (_instance == null) {
  //     _instance = CartNotifier._internal();
  //   }
  //   return _instance!;
  // }

  Future addToCart(Book book) async {
    final added = await _booksService.addBookToCart(CartItem.fromBook(book));
    if (added) {
      if (cart.any((element) => element.id == book.id)) {
        cart.firstWhere((element) => element.id == book.id).quantity++;
      } else {
        cart.add(CartItem.fromBook(book));
      }
      print(cart.length);
    } else {
      return 'error';
    }
    notifyListeners();
  }

  Future removeFromCart(int bookId) async {
    if (cart.firstWhere((e) => e.id == bookId).quantity > 1) {
      cart.firstWhere((e) => e.id == bookId).quantity--;
    } else {
      cart.removeWhere((e) => e.id == bookId);
    }
    notifyListeners();
  }

  double get total {
    var tot = 0.0;
    cart.forEach((e) {
      tot += e.price * e.quantity;
    });
    return tot;
  }

  Future<bool> order() async {
    if ((await _booksService.submitOrder())) {
      cart = [];
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
