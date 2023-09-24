
class RestaurantForCard {
  String restaurantId;
  String logoImageUrl;
  String title;
  List categories;
  bool fav;
  bool verified;

  RestaurantForCard({
    this.restaurantId = '',
    this.logoImageUrl = '',
    this.title = '',
    this.categories = const [],
    this.fav = false,
    this.verified = false,

  });

  factory RestaurantForCard.fromMap(Map<String, dynamic> map) {
    return RestaurantForCard(
      restaurantId: map['restaurantId'] ?? '',
      title: map['title'] ?? '',
      logoImageUrl: map['logoImageUrl'] ?? '',
      categories: map['categories'] ?? [],
      fav: map['fav'] ?? false,
      verified: map['verified'] ?? false,
    );
  }

  static Map<String, dynamic> toMap(RestaurantForCard restaurantCard) => {
    "restaurantId": restaurantCard.restaurantId,
    "title": restaurantCard.title,
    "logoImageUrl": restaurantCard.logoImageUrl,
    "categories": restaurantCard.categories,
    "fav": restaurantCard.fav,
    "verified": restaurantCard.verified,
  };
}

// for firebase
class RestaurantDetails {
  String restaurantId;
  String title;
  String coverUrl;
  String logoImageUrl;
  int views;
  bool valid;
  bool fav;
  bool verified;
  List<String> menuImagesList;
  List<String> restaurantImagesList;
  DateTime lastUpdate = DateTime.now();
  List branches;
  DateTime workDate = DateTime.now();
  List features;
  List categories;


  RestaurantDetails({
    this.restaurantId = "",
    this.title = "",
    this.coverUrl = "",
    this.logoImageUrl = "",
    this.views = 0,
    this.valid = false,
    this.fav = false,
    this.verified = false,
    this.menuImagesList = const [],
    this.restaurantImagesList = const [],
    this.branches = const [],
    this.features = const [],
    this.categories = const [],
  });

  factory RestaurantDetails.fromMap(Map<String, dynamic> map) {
    return RestaurantDetails(
      restaurantId: map['restaurantId'] ?? '',
      title: map['title'] ?? '',
      coverUrl: map['coverUrl'] ?? '',
      logoImageUrl: map['logoImageUrl'] ?? '',
      views: map['views'] ?? 0,
      valid: map['valid'] ?? false,
      fav: map['fav'] ?? false,
      verified: map['verified'] ?? false,
      menuImagesList: map['menuImagesList'] ?? [],
      restaurantImagesList: map['restaurantImagesList'] ?? [],
      branches: map['branches'] ?? [],
      features: map['features'] ?? [],
      categories: map['categories'] ?? [],
    );
  }

  static Map<String, dynamic> toMap(RestaurantDetails restaurantDetails) => {
    "restaurantId": restaurantDetails.restaurantId,
    "title": restaurantDetails.title,
    "coverUrl": restaurantDetails.coverUrl,
    "logoImageUrl": restaurantDetails.logoImageUrl,
    "views": restaurantDetails.views,
    "valid": restaurantDetails.valid,
    "fav": restaurantDetails.fav,
    "verified": restaurantDetails.verified,
    "menuImagesList": restaurantDetails.menuImagesList,
    "restaurantImagesList": restaurantDetails.restaurantImagesList,
    "branches": restaurantDetails.branches,
    "features": restaurantDetails.features,
    "categories": restaurantDetails.categories,
  };
}