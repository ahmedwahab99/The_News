import 'package:flutter/material.dart';
import 'package:the_newes/Model/article.dart';
import 'article_card.dart';


class NewsScrollableList extends StatelessWidget {
  const NewsScrollableList({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
          

          itemCount: articles.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ArticleCard(
                article: articles[index]
              );
            }
          ),
    );
  }
}