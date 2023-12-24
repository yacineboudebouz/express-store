import 'dart:convert';

import 'package:express_shop/src/features/home/domain/on_sell_book.dart';

class OnDealBook extends OnSellBook {
  OnDealBook(
      {required super.id,
      required super.title,
      required super.author,
      required super.coverPic,
      required super.genre,
      required super.price,
      required super.isbn,
      required this.discountPersountage});
  final int discountPersountage;

  @override
  OnDealBook copyWith(
      {int? id,
      String? title,
      String? author,
      String? coverPic,
      String? genre,
      double? price,
      String? isbn,
      int? discountPersountage}) {
    return OnDealBook(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        coverPic: coverPic ?? this.coverPic,
        genre: genre ?? this.genre,
        price: price ?? this.price,
        isbn: isbn ?? this.isbn,
        discountPersountage: discountPersountage ?? this.discountPersountage);
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
      'ISBN': isbn,
      'DiscountPercentage': discountPersountage
    };
  }

  OnSellBook toOnSellBook() {
    return OnSellBook(
        id: id,
        title: title,
        author: author,
        coverPic: coverPic,
        genre: genre,
        price: price - (price * discountPersountage) / 100,
        isbn: isbn);
  }

  factory OnDealBook.fromMap(Map<String, dynamic> map) {
    return OnDealBook(
        id: map['BookID'] as int,
        title: map['Title'] as String,
        author: map['Author'] as String,
        coverPic: map['ImageURL'] as String,
        genre: map['Genre'] as String,
        price: map['Price'] as double,
        isbn: map['ISBN'] as String,
        discountPersountage: map["DiscountPercentage"] as int);
  }
  @override
  String toJson() => json.encode(toMap());

  factory OnDealBook.fromJson(String source) =>
      OnDealBook.fromMap(json.decode(source) as Map<String, dynamic>);
}
