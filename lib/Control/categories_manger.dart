import "package:the_newes/Model/category.dart";

List<Category> getCategories() {
  List<Category> categories = [];
  List<String> names = [
    "Technology",
    "Business",
    "Health",
    "Sports",
    "General"
  ];
  List<String> images = [
    'images/Technology.jpg',
    'images/Business.jpg',
    'images/Health.jpg',
    'images/Sports.jpg',
    'images/General.jpg'
  ];

  for (int i = 0; i < names.length; i++) {
    Category category = Category();
    category.categoryName = names[i];
    category.image = images[i];
    categories.add(category);
  }

  return categories;
}
