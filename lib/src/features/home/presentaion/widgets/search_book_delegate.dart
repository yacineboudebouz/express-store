import 'package:express_shop/src/core/common/error_message_widget.dart';
import 'package:express_shop/src/features/search/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBookDelegate extends SearchDelegate {
  final WidgetRef ref;
  SearchBookDelegate(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ref.watch(searchBookProvider(query)).when(
        data: (books) => ListView.builder(
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(book.coverPic),
                  ),
                  title: Text('r/${book.title}'),
                  onTap: () {},
                );
              },
              itemCount: books.length,
            ),
        error: (error, stacktrace) => ErrorMessageWidget(
              errorMessage: error.toString(),
            ),
        loading: () => Center(child: const CircularProgressIndicator()));
  }
}
