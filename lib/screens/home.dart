import 'package:flutter/material.dart';
import 'package:news_app/common/widgets/app_bar_icon.dart';
import 'package:news_app/common/widgets/bottom_app_bar.dart';
import 'package:news_app/common/widgets/home_news_slider.dart';
import 'package:news_app/common/widgets/news_card.dart';
import 'package:news_app/services/api_request.dart';
import 'package:news_app/services/models/news_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

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
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppBarIcon(
              icon: Icons.menu,
            ),
            const Spacer(),
            Row(
              children: const [
                AppBarIcon(
                  icon: Icons.search,
                ),
                SizedBox(width: 10),
                AppBarIcon(
                  icon: Icons.notifications_none_outlined,
                )
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Breaking News',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text('View all', style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          ),
          const SizedBox(height: 25),
          HomeNewsSlider(onPageChanged: (index, reason) {
            setState(() {
              currentPageIndex = index;
            });
          }),
          const SizedBox(height: 15),
          AnimatedSmoothIndicator(
            activeIndex: currentPageIndex,
            count: 6,
            curve: Curves.easeInOut,
            effect: ExpandingDotsEffect(
                spacing: 6.0,
                dotWidth: 8.0,
                dotHeight: 9.0,
                strokeWidth: 1.5,
                dotColor: Colors.grey.shade300,
                activeDotColor: Colors.blue), // your preferred effect
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommendation',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text('View all', style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NewsCard(
                      urlImage: newsContents?[0].newsUrlImage,
                      title: newsContents?[0].newsTitle,
                    ),
                    NewsCard(
                      urlImage: newsContents?[1].newsUrlImage,
                      title: newsContents?[1].newsTitle,
                    ),
                    NewsCard(
                      urlImage: newsContents?[2].newsUrlImage,
                      title: newsContents?[2].newsTitle,
                    ),
                    NewsCard(
                      urlImage: newsContents?[3].newsUrlImage,
                      title: newsContents?[4].newsTitle,
                    ),
                    NewsCard(
                      urlImage: newsContents?[5].newsUrlImage,
                      title: newsContents?[5].newsTitle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
