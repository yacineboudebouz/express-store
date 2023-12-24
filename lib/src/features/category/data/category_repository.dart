import 'dart:convert';

import 'package:express_shop/src/core/providers/uri_provider.dart';
import 'package:express_shop/src/features/home/domain/on_sell_book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

class CategoryRepository {
  Future<List<OnSellBook>> getBooksCategory(String category) async {
    http.Response res = await http.get(
        Uri.parse(
          '$uri/book/getbookbygenre/$category',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if (res.statusCode == 200) {
      var booksFromServer = jsonDecode(res.body)['books'];
      List<OnSellBook> books = [];
      for (var book in booksFromServer) {
        books.add(OnSellBook.fromMap(book));
      }
      return books;
    }
    throw "Ethernal server error ! can't get books ";
  }
}
