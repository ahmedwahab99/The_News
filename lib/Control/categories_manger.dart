import "package:the_newes/Model/category.dart";

List<Category> getCategories() {
  List<Category> categories = [];
  List<String> names = [
    "General",
    "Technology",
    "Business",
    "Health",
    "Sports"
  ];
  List<String> images = [
    'images/General.jpg',
    'images/Technology.jpg',
    'images/Business.jpg',
    'images/Health.jpg',
    'images/Sports.jpg',
  ];

  for (int i = 0; i < names.length; i++) {
    Category category = Category();
    category.categoryName = names[i];
    category.image = images[i];
    categories.add(category);
  }

  return categories;
}
