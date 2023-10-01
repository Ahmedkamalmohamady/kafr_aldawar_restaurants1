
import 'dart:convert';


class Category {
  List<String> restaurantIdsList;
  String title;
  String logoUrl;

  Category({
    this.restaurantIdsList = const [],
    this.title = "",
    this.logoUrl = "",
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      restaurantIdsList: List<String>.from(map['restaurantIdsList'] ?? []),
      title: map['title'] ?? '',
      logoUrl: map['logoUrl'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(Category restaurantDetails) => {
    "restaurantIdsList": restaurantDetails.restaurantIdsList,
    "title": restaurantDetails.title,
    "logoUrl": restaurantDetails.logoUrl,
  };

  static String encode(List<Category> categoryList) => json.encode(
      categoryList.map<Map<String, dynamic>>((category) => Category.toMap(category)).toList());

  static List<Category> decode(String categoryList) => ((json.decode(categoryList))
      .map((item) => item as Map<String, dynamic>).toList())
      .map<Category>((item) => Category.fromMap(item)).toList();
}