import 'dart:convert';
import 'package:diabetica/models/News.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewsService {
  Future<List<News>> fetchNews() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Cek apakah data sudah tersimpan di cache
    final String? cachedData = prefs.getString('cachedNews');
    if (cachedData != null && cachedData.isNotEmpty) {
      final List<dynamic> cachedArticles = json.decode(cachedData);
      return cachedArticles.map((json) => News.fromJson(json)).toList();
    } else {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=7eaf31ff07674926a2926a8aa57799f8'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];

        // Simpan data ke cache
        prefs.setString('cachedNews', json.encode(articles));

        return articles.map((json) => News.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    }
  }
}
