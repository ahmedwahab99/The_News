import 'package:flutter/cupertino.dart';
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
      body: ListView(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                widget.article.imageURL,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(widget.article.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.source,
                  size: 25,
                  color: Colors.blue[900],
                ),
                 Text(
                  " Source:  ",
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 19,
                  ),
                ),
                Text(
                  widget.article.source,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(widget.article.content,
                style: const TextStyle(color: Colors.white70, fontSize: 25)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ArticleInWeb(url: widget.article.articleURL)));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: Colors.grey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.view_carousel_outlined,
                      size: 30,
                      color: Colors.blue[900],
                    ),
                    const Text(
                      "  Read the full article",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
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