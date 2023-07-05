import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:news_app/services/news_album.dart';

const apiKey = 'ee5d92c780fa41e493b93a61619b5deb';
const baseURL = 'https://newsapi.org/v2';

class GetRequest {
  Future<dynamic> getNewsData() async {
    http.Response response = await http
        .get(Uri.parse('$baseURL/top-headlines?country=us&apiKey=$apiKey'));
    dynamic data, statusCode;
    if (response.statusCode == 200) {
      data = response.body;
      // return NewsAlbum.fromJson(jsonDecode(data));

      return jsonDecode(data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      // ignore: avoid_print
      print(statusCode);
      // throw Exception('Failed to load album');
    }
  }
}
