import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';

import '../models/category_model.dart';
import '../models/restaurant_model.dart';

class RestaurantsFirebaseManger {

  static Future<List<RestaurantForCard>> getRestaurants() async {

    QuerySnapshot snapshots;
    try{
      snapshots = await FirebaseFirestore.instance.collection('Restaurants').get();

      List<RestaurantForCard> restaurantForCardList = [];

      Map<String, dynamic> map ;

      for (var snapshot in snapshots.docs){
        map = snapshot.data() as Map<String, dynamic>;
        restaurantForCardList.add(RestaurantForCard(
          restaurantId: snapshot.id,
          title: map['title'] as String,
          coverUrl: map['coverUrl'] as String,
          logoImageUrl: map['logoImageUrl'] as String,
          categories: List<String>.from(map['categories'] ?? []),
          fav: map['fav'] ?? false,
          verified: map['verified'] ?? false,
        ));
      }

      return restaurantForCardList;
    }on FirebaseException {
      rethrow;
    }
  }

  static Future<RestaurantDetails> getRestaurant(String restaurantId) async {
    DocumentSnapshot doc;
    try{
      doc = await FirebaseFirestore.instance
          .collection('Restaurants')
          .doc(restaurantId)
          .get();
      if (doc.exists) {
        var map = doc.data() as Map<String, dynamic>;
        return RestaurantDetails.fromMap(map);
      } else {
        throw('something wont wrong');
      }
    }on FirebaseException {
      rethrow;
    }
  }

  static Future<List<Category>> getCategories() async {

    QuerySnapshot snapshots;
    try{
      snapshots = await FirebaseFirestore.instance.collection('Categories').get();

      List<Category> categoriesList = [];
      Map<String, dynamic> map;

      for (var snapshot in snapshots.docs){
        map = snapshot.data() as Map<String, dynamic>;
        categoriesList.add(Category.fromMap({
          'title': snapshot.id,
          'restaurantIdsList': map['restaurantIdsList'] as dynamic,
          'logoUrl': map['logoUrl'] as String
        }));
      }

      return categoriesList;
    }on FirebaseException {
      rethrow;
    }
  }

  static Future<List<RestaurantDetails>> getRestaurantsByIds(List<String> restaurantsIdsList) async {

    try{
      List<RestaurantDetails> restaurantDetailsList = [];
      RestaurantDetails restaurantDetails;

      for(String id in restaurantsIdsList){
        restaurantDetails = await getRestaurant(id);
        restaurantDetailsList.add(restaurantDetails);
      }

      return restaurantDetailsList;
    }on FirebaseException {
      rethrow;
    }

  }
}