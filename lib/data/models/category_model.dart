
class Category {
  List<String> restaurantIdsList;
  String title;
  String imageUrl;

  Category({
    this.restaurantIdsList = const [],
    this.title = "",
    this.imageUrl = "",
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      restaurantIdsList: map['restaurantIdsList'] ?? '',
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(Category restaurantDetails) => {
    "restaurantIdsList": restaurantDetails.restaurantIdsList,
    "title": restaurantDetails.title,
    "imageUrl": restaurantDetails.imageUrl,
  };
}