import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/services/api_request.dart';
import 'package:news_app/services/models/news_content.dart';
import 'package:news_app/services/news_album.dart';

class HomeNewsSlider extends StatefulWidget {
  const HomeNewsSlider({super.key, this.onPageChanged});

  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  State<HomeNewsSlider> createState() => _HomeNewsSliderState();
}

class _HomeNewsSliderState extends State<HomeNewsSlider> {
  String? title;
  String? description;
  String? urlImage;
  String? source;
  int? results;
  List<String>? newsTitles;
  List<NewsContent>? newsContents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsInfo();
  }

  dynamic newsInfo() async {
    GetRequest getRequest = GetRequest();
    dynamic newsData = await getRequest.getNewsData();
    // results = newsData['totalResults'];
    // title = newsData['articles'][0]['title'];
    // description = newsData['articles'][0]['description'];
    // urlImage = newsData['articles'][0]['urlToImage'];
    // source = newsData['articles'][0]['source']['name'];

    newsContents = [
      NewsContent(
        title: newsData['articles'][0]['title'],
        description: newsData['articles'][0]['description'],
        urlImage: newsData['articles'][0]['urlToImage'],
        source: newsData['articles'][0]['source']['name'],
      ),
      NewsContent(
        title: newsData['articles'][1]['title'],
        description: newsData['articles'][1]['description'],
        urlImage: newsData['articles'][1]['urlToImage'],
        source: newsData['articles'][1]['source']['name'],
      ),
      NewsContent(
        title: newsData['articles'][2]['title'],
        description: newsData['articles'][2]['description'],
        urlImage: newsData['articles'][2]['urlToImage'],
        source: newsData['articles'][2]['source']['name'],
      ),
      NewsContent(
        title: newsData['articles'][3]['title'],
        description: newsData['articles'][3]['description'],
        urlImage: newsData['articles'][3]['urlToImage'],
        source: newsData['articles'][3]['source']['name'],
      ),
      NewsContent(
        title: newsData['articles'][4]['title'],
        description: newsData['articles'][4]['description'],
        urlImage: newsData['articles'][4]['urlToImage'],
        source: newsData['articles'][4]['source']['name'],
      ),
      NewsContent(
        title: newsData['articles'][5]['title'],
        description: newsData['articles'][5]['description'],
        urlImage: newsData['articles'][5]['urlToImage'],
        source: newsData['articles'][5]['source']['name'],
      ),
    ];
    // print(newsTitles[1]);
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        // carouselController: controller,
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 0.87,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.25,
          onPageChanged: widget.onPageChanged,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: newsContents != null ? newsContents!.length : 6,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          // final newsContent =
          //     newsContents?[itemIndex] ?? 'Getting News Data....';

          return NewsBoard(
            urlImage: newsContents?[itemIndex].newsUrlImage,
            title:
                newsContents?[itemIndex].newsTitle ?? 'Getting News Data....',
            source: newsContents?[itemIndex].newsSource,
          );
        });
  }
}

class NewsBoard extends StatelessWidget {
  const NewsBoard({
    super.key,
    required this.urlImage,
    required this.title,
    required this.source,
  });

  final String? urlImage;
  final String? title;
  final String? source;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // margin: const EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        image: urlImage != null
            ? DecorationImage(
                image: NetworkImage('$urlImage'),
                fit: BoxFit.cover,
              )
            : const DecorationImage(
                image: AssetImage('assets/images/book.jpg'),
                fit: BoxFit.cover,
              ),
      ),
      child: title != null
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'News',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        source != null ? '$source' : 'Getting Source Data....',
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 45,
                        child: Text(
                          '$title',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
