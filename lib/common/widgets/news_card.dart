import 'package:flutter/material.dart';
import 'package:news_app/services/api_request.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, this.title, this.urlImage});

  final String? title;
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Row(
            children: [
              urlImage != null
                  ? Container(
                      height: 130,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage('$urlImage'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      height: 130,
                      width: 125,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/book.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sports',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title != null ? '$title' : 'Getting News Data....',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    CircleAvatar(radius: 12),
                    SizedBox(width: 10),
                    Text(
                      'McKidney',
                      style: TextStyle(
                        fontSize: 15.5,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Feb 27, 2023',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
