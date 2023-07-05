import 'package:news_app/services/api_request.dart';

class NewsContent {
  String? newsTitle, newsDescription, newsUrlImage, newsSource;
  NewsContent({
    String? title,
    String? description,
    String? urlImage,
    String? source,
  }) {
    newsTitle = title;
    newsDescription = description;
    newsUrlImage = urlImage;
    newsSource = source;
  }

  // dynamic newsInfo(int index) async {
  //   GetRequest getRequest = GetRequest();
  //   dynamic newsData = await getRequest.getNewsData();
  //   int results = newsData['totalResults'];
  //   String title = newsData['articles'][index]['title'];
  //   String description = newsData['articles'][index]['description'];
  //   String urlImage = newsData['articles'][index]['urlToImage'];
  //   String source = newsData['articles'][index]['source']['name'];

  //   print(results);
  // }
}
