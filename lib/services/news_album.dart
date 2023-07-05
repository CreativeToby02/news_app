import 'package:news_app/services/api_request.dart';

class NewsAlbum {
  static late String? title, source, category, urlToImage;
  static int? results;

  dynamic newsInfo() async {
    GetRequest getRequest = GetRequest();
    dynamic newsData = await getRequest.getNewsData();
    updateUI(newsData);
    // print(newsData);
    print(results);
  }

  void updateUI(newsData) {
    // int randomNewsIndex = Random().nextInt(results!);
    results = newsData['totalResults'];
    title = newsData['articles'][0]['title'];
    urlToImage = newsData['articles'][0]['urlToImage'];
    source = newsData['articles'][0]['source']['name'];
  }
}
