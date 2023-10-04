
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

  factory RestaurantForCard.fromMap(Map<String, dynamic> map, String id) {
    return RestaurantForCard(
      restaurantId: id,
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

  factory RestaurantDetails.fromMap(Map<String, dynamic> map, String id, bool fav) {
    return RestaurantDetails(
      restaurantId: id,

      title: map['title'] ?? '_empty_title',

      coverUrl: map['coverUrl'] ?? '_empty_coverUrl',
      logoImageUrl: map['logoImageUrl'] ?? '_empty_logoUrl',

      menuImagesList: List<String>.from(map['menuImagesList'] ?? []),
      restaurantImagesList: List<String>.from(map['restaurantImagesList'] ?? []),

      lastUpdate : map['lastUpdate'] == null ? DateTime.now() : DateTime.parse(map['lastUpdate'] as String),
      startTime: map['startTime'] ?? 8,
      endTime: map['endTime'] ?? 23,

      branches: map['branches'] == null ? []: Branch.decode(List<Map<String, dynamic>>.from(map['branches'])),
      features: List<String>.from(map['features'] ?? []),
      categories: List<String>.from(map['categories'] ?? []),

      views: map['views'] ?? 0,
      valid: false,
      fav: fav,
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

    "lastUpdate": restaurantDetails.lastUpdate?.toIso8601String(),

    "startTime": restaurantDetails.startTime,
    "endTime": restaurantDetails.endTime,

    "branches": Branch.encode(restaurantDetails.branches),

    "features": restaurantDetails.features,
    "categories": restaurantDetails.categories,

    "views": restaurantDetails.views,
    "verified": restaurantDetails.verified,
  };
}