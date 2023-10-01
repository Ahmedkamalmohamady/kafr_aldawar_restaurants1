
import 'dart:convert';

class Feature {
  List<String> restaurantIdsList;
  String title;
  String imageUrl;

  Feature({
    this.restaurantIdsList = const [],
    this.title = "",
    this.imageUrl = "",
  });

  factory Feature.fromMap(Map<String, dynamic> map) {
    return Feature(
      restaurantIdsList: map['restaurantIdsList'] ?? '',
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(Feature restaurantDetails) => {
    "restaurantIdsList": restaurantDetails.restaurantIdsList,
    "title": restaurantDetails.title,
    "imageUrl": restaurantDetails.imageUrl,
  };

  static String encode(List<Feature> categoryList) => json.encode(
      categoryList.map<Map<String, dynamic>>((category) => Feature.toMap(category)).toList());

  static List<Feature> decode(String categoryList) => ((json.decode(categoryList))
      .map((item) => item as Map<String, dynamic>).toList())
      .map<Feature>((item) => Feature.fromMap(item)).toList();
}