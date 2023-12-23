import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book {
  final int id;
  final String title;
  final String author;
  final String coverPic;
  final String genre;
  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverPic,
    required this.genre,
  });

  Book copyWith({
    int? id,
    String? title,
    String? author,
    String? coverPic,
    String? genre,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      coverPic: coverPic ?? this.coverPic,
      genre: genre ?? this.genre,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'coverPic': coverPic,
      'genre': genre,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int,
      title: map['title'] as String,
      author: map['author'] as String,
      coverPic: map['coverPic'] as String,
      genre: map['genre'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);
}
