// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

List<Book> bookFromJson(String str) =>
    List<Book>.from((json.decode(str) as List)
        .map((x) => Book.fromJson(x as Map<String, dynamic>)));

String bookToJson(List<Book> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
    required this.publishDate,
    required this.image,
    required this.rentPrice,
    required this.pages,
    required this.publisher,
    required this.language,
    required this.rate,
    required this.votes,
    required this.totalRate,
  });

  final int id;
  final String title;
  final String description;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String author;
  final DateTime publishDate;
  final String image;
  final int rentPrice;
  final int pages;
  final String publisher;
  final String language;
  final double rate;
  final int votes;
  final int totalRate;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"] as int,
        title: json["title"] as String,
        description: json["description"] as String,
        price: json["price"] as int,
        createdAt: DateTime.parse(json["created_at"] as String),
        updatedAt: DateTime.parse(json["updated_at"] as String),
        author: json["author"] as String,
        publishDate: DateTime.parse(json["publish_date"] as String),
        image: 'http://10.0.2.2:8000/storage/${json["image"]}',
        rentPrice: json["rent_price"] as int,
        pages: json["pages"] as int,
        publisher: json["publisher"] as String,
        language: json["language"] as String,
        rate: double.parse(json["rate"].toString()),
        votes: json["votes"] as int,
        totalRate: json["total_rate"] as int,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "author": author,
        "publish_date":
            "${publishDate.year.toString().padLeft(4, '0')}-${publishDate.month.toString().padLeft(2, '0')}-${publishDate.day.toString().padLeft(2, '0')}",
        "image": image,
        "rent_price": rentPrice,
        "pages": pages,
        "publisher": publisher,
        "language": language,
        "rate": rate,
        "votes": votes,
        "total_rate": totalRate,
      };
}
