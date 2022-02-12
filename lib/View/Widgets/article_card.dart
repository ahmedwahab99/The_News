import 'package:flutter/material.dart';
import 'package:the_newes/Model/article.dart';
import 'package:the_newes/View/articleInWeb.dart';
import 'package:the_newes/View/article_page.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({Key? key, required this.article}) : super(key: key);
  late String articleImage = article.imageURL,
      articleTitle = article.title,
      articleText = article.text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticlePage(article: article)

                /*ArticleInWeb(
                       url: article.articleURL,
                    )*/
                ));
      },
      child: Column(
        children: [
          Container(
            color: Colors.grey[850],
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  articleImage,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 8),
          Text(
            articleTitle,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(articleText, style: const TextStyle(color: Colors.white30)),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
