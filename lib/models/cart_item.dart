import './book.dart';

class CartItem {
  final int id;
  final String title;
  int quantity;
  final int price;

  CartItem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title});

  factory CartItem.fromBook(Book book) {
    return CartItem(
        id: book.id, price: book.price, quantity: 1, title: book.title);
  }

  Map<String, dynamic> toJson() => {
        'books': [
          {
            'id': id,
            'amount': quantity,
            'status': 'order',
            'order_type': 1,
          }
        ]
      };
}
