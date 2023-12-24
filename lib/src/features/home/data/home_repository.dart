import 'dart:convert';

import 'package:express_shop/src/core/providers/uri_provider.dart';
import 'package:express_shop/src/features/home/domain/on_deal_book.dart';
import 'package:express_shop/src/features/home/domain/on_sell_book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

class HomeRepository {
  Future<List<OnDealBook>> getDeals() async {
    http.Response res = await http.get(
        Uri.parse(
          '$uri/book/getdeals',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if (res.statusCode == 200) {
      var dealsFromServer = jsonDecode(res.body)['deals'];

      List<OnDealBook> deals = [];
      for (var deal in dealsFromServer) {
        deals.add(OnDealBook.fromMap(deal));
      }

      return deals;
    }
    throw "cannot get deals";
  }

  Future<List<OnSellBook>> getRandomBooks() async {
    http.Response res = await http.get(
        Uri.parse(
          '$uri/book/getrandombooks',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if (res.statusCode == 200) {
      var booksFromServer = jsonDecode(res.body)['randomBooks'];
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
