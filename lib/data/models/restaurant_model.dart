
import 'branches_model.dart';

class RestaurantForCard {
  String restaurantId;
  String coverUrl;
  String logoImageUrl;
  String title;
  List<String> categories;
  bool fav;
  bool verified;

  RestaurantForCard({
    this.restaurantId = '',
    this.coverUrl = '',
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
      coverUrl: map['coverUrl'] ?? '',
      logoImageUrl: map['logoImageUrl'] ?? '',
      categories: map['categories'] ?? [],
      fav: map['fav'] ?? false,
      verified: map['verified'] ?? false,
    );
  }

  static Map<String, dynamic> toMap(RestaurantForCard restaurantCard) => {
    "restaurantId": restaurantCard.restaurantId,
    "title": restaurantCard.title,
    "coverUrl": restaurantCard.coverUrl,
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

  List<String> menuImagesList;
  List<String> restaurantImagesList;

  DateTime? lastUpdate = DateTime.now();
  int startTime;
  int endTime;

  List<Branch> branches;
  List<String> features;
  List<String> categories;

  int views;
  bool valid;
  bool fav;
  bool verified;


  RestaurantDetails({
    this.restaurantId = "",

    this.title = "",

    this.coverUrl = "",
    this.logoImageUrl = "",

    this.menuImagesList = const [],
    this.restaurantImagesList = const [],

    this.lastUpdate,
    this.startTime = 8,
    this.endTime = 23,

    this.branches = const [],
    this.features = const [],
    this.categories = const [],

    this.views = 0,
    this.valid = false,
    this.fav = false,
    this.verified = false,
  });

  factory RestaurantDetails.fromMap(Map<String, dynamic> map) {
    return RestaurantDetails(
      restaurantId: map['restaurantId'] ?? '',

      title: map['title'] ?? '',

      coverUrl: map['coverUrl'] ?? '',
      logoImageUrl: map['logoImageUrl'] ?? '',

      menuImagesList: map['menuImagesList'] ?? [],
      restaurantImagesList: map['restaurantImagesList'] ?? [],

      lastUpdate : map['lastUpdate'] ?? DateTime.now(),
      startTime: map['startTime'] ?? 8,
      endTime: map['endTime'] ?? 23,

      branches: map['branches'] == null ? []: Branch.decode(map['branches']),
      features: map['features'] ?? [],
      categories: map['categories'] ?? [],

      views: map['views'] ?? 0,
      valid: map['valid'] ?? false,
      fav: map['fav'] ?? false,
      verified: map['verified'] ?? false,
    );
  }

  static Map<String, dynamic> toMap(RestaurantDetails restaurantDetails) => {
    "restaurantId": restaurantDetails.restaurantId,

    "title": restaurantDetails.title,

    "coverUrl": restaurantDetails.coverUrl,
    "logoImageUrl": restaurantDetails.logoImageUrl,

    "menuImagesList": restaurantDetails.menuImagesList,
    "restaurantImagesList": restaurantDetails.restaurantImagesList,

    "lastUpdate": restaurantDetails.lastUpdate,

    "startTime": restaurantDetails.startTime,
    "endTime": restaurantDetails.endTime,

    "branches": Branch.encode(restaurantDetails.branches),

    "features": restaurantDetails.features,
    "categories": restaurantDetails.categories,

    "views": restaurantDetails.views,
    "valid": restaurantDetails.valid,
    "fav": restaurantDetails.fav,
    "verified": restaurantDetails.verified,
  };
}