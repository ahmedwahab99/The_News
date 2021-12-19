import 'package:flutter/material.dart';
import 'package:the_newes/Model/category.dart';
import 'package:the_newes/Control/categories_manger.dart';
import 'package:the_newes/View/Widgets/category_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = <Category>[];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 70,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryCard(category: categories[index]);
                }),
          )
        ],
      ),
    );
  }
}
