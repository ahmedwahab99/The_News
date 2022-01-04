import 'package:flutter/material.dart';
import 'package:the_newes/Model/article.dart';
import 'package:the_newes/Model/category.dart';
import 'package:the_newes/Control/categories_manger.dart';
import 'package:the_newes/View/Widgets/categories_row.dart';
import 'package:the_newes/Control/news_manger.dart';
import 'package:the_newes/View/Widgets/newsScrollableList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  List<Category> categories = <Category>[];
  List<Article> articles = <Article>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getnews();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  getnews() async {
    NewsManger newsManger = NewsManger();
    await newsManger.getNews();
    setState(() {
      articles = newsManger.news;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey[900],
              ),
            )
          : SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                child: Column(
                  children: <Widget>[

                    CategoriesRow(categories: categories),
                    NewsScrollableList(articles: articles)
                  
                  ],
                ),
              ),
            ),
    );
  }
}
