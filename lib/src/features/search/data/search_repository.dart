import 'dart:convert';

import 'package:express_shop/src/features/home/domain/on_sell_book.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../core/providers/uri_provider.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository();
});

class SearchRepository {
  Future<List<OnSellBook>> searchBook(String query) async {
    http.Response res = await http.get(
        Uri.parse(
          '$uri/book/searchbook/$query',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if (res.statusCode == 200) {
      var booksFromServer = jsonDecode(res.body)['myBooks'];
      print(booksFromServer);
      List<OnSellBook> books = [];

      for (var book in booksFromServer) {
        books.add(OnSellBook.fromMap(book));
      }
      return books;
    }
    throw "Ethernal server error ! can't get books ";
  }
}
