import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tech_news_app/components/searchbar.dart';
import 'package:tech_news_app/utils/key.dart';

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/top-headlines?category=technology&pageSize=100&apiKey=' +
          Key.key +
          '&q=' +
          searchBar.searchController.text,
    ),
  );
  Map result = jsonDecode(response.body);
  return result['articles'];
}
