import 'dart:convert';

import '../../book/domain/book.dart';

class OnSellBook extends Book {
  OnSellBook(
      {required super.id,
      required super.title,
      required super.author,
      required super.coverPic,
      required super.genre,
      required super.description,
      required this.price,
      required this.isbn});
  final double price;
  final String isbn;
  @override
  OnSellBook copyWith(
      {int? id,
      String? title,
      String? author,
      String? coverPic,
      String? genre,
      double? price,
      String? isbn,
      String? description}) {
    return OnSellBook(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        coverPic: coverPic ?? this.coverPic,
        genre: genre ?? this.genre,
        price: price ?? this.price,
        isbn: isbn ?? this.isbn,
        description: description ?? this.description);
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'BookID': id,
      'Title': title,
      'Author': author,
      'ImageURL': coverPic,
      'Genre': genre,
      'Price': price,
      'ISBN': isbn
    };
  }

  factory OnSellBook.fromMap(Map<String, dynamic> map) {
    return OnSellBook(
      id: map['BookID'] as int,
      title: map['Title'] as String,
      author: map['Author'] as String,
      coverPic: map['ImageURL'] as String,
      genre: map['Genre'] as String,
      price: map['Price'] as double,
      isbn: map['ISBN'] as String,
      description: map['Description'] as String,
    );
  }
  @override
  String toJson() => json.encode(toMap());

  factory OnSellBook.fromJson(String source) =>
      OnSellBook.fromMap(json.decode(source) as Map<String, dynamic>);
}
