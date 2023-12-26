import 'dart:convert';

import 'package:express_shop/src/features/home/domain/on_sell_book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../core/providers/uri_provider.dart';

final bookRepositoryProvider = Provider<Bookrepository>((ref) {
  return Bookrepository();
});

class Bookrepository {
  Future<OnSellBook> getBookById(int id) async {
    http.Response res = await http.get(
        Uri.parse(
          '$uri/book/getbook/$id',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
      return OnSellBook.fromMap(jsonDecode(res.body));
    }
    if (res.statusCode == 404) {
      throw "Book not found";
    }
    throw "Ethernal server error ! can't get books ";
  }
}
