class Category {
  List<String> restaurantIdsList;
  String title;
  String logoUrl;

  Category({
    this.restaurantIdsList = const [],
    this.title = "",
    this.logoUrl = "",
  });

  factory Category.fromMap(Map<String, dynamic> map, String id) {
    return Category(
      restaurantIdsList: List<String>.from(map['restaurantIdsList'] ?? []),
      title: id,
      logoUrl: map['logoUrl'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(Category restaurantDetails) => {
    "restaurantIdsList": restaurantDetails.restaurantIdsList,
    "title": restaurantDetails.title,
    "logoUrl": restaurantDetails.logoUrl,
  };
}