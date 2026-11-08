import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modeli/post.dart';

class ServisPostova {
  const ServisPostova();
  static final _feed = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  Future<List<Post>> dohvatiPostove() async {
    final response = await http.get(_feed).timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) {
      throw Exception('Neuspješno dohvaćanje postova (${response.statusCode})');
    }
    final podaci = jsonDecode(response.body) as List<dynamic>;
    return podaci
        .map((item) => Post.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  Stream<List<Post>> pratiPostove() async* {
    while (true) {
      yield await dohvatiPostove();
      await Future.delayed(const Duration(minutes: 1));
    }
  }
}
