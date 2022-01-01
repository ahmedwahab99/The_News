import 'package:flutter/material.dart';
import 'package:the_newes/Model/category.dart';
import 'package:the_newes/View/Widgets/category_card.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          }),
    );
  }
}
