import 'package:flutter/material.dart';
import 'package:the_newes/Model/article.dart';
import 'package:the_newes/View/articleInWeb.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage({required this.article, Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "THE",
              style: TextStyle(color: Colors.grey[200]),
            ),
            Text(
              "NEWS",
              style: TextStyle(color: Colors.blue[700]),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                widget.article.imageURL,
              )),
          Text(widget.article.title,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(widget.article.content,
              style: const TextStyle(color: Colors.white30)),
        ],
      ),
    );
  }
}


/*
GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticleInWeb(imageUrl: widget.article.imageURL)
                      
                      )
                    );
              },
              child: Container(
                child: Text("Open In Web", style: TextStyle(color: Colors.grey),),
                width: MediaQuery.of(context).size.width,
                height: 50,
                )
              ),
*/ 