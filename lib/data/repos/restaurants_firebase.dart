import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';

import '../../shared/global.dart';
import '../models/category_model.dart';
import '../models/restaurant_model.dart';

class RestaurantsFirebaseManger {

  static Future<List<RestaurantDetails>> getRestaurantsDetails() async {

    QuerySnapshot snapshots;
    try{
      snapshots = await FirebaseFirestore.instance.collection('Restaurants').get();

      List<RestaurantDetails> restaurantsDetails = [];

      Map<String, dynamic> map ;
      bool fav;

      for (var snapshot in snapshots.docs){
        map = snapshot.data() as Map<String, dynamic>;
        fav = favRestaurantsIds.contains(snapshot.id) ? true : false;
        restaurantsDetails.add(RestaurantDetails.fromMap(map, snapshot.id, fav));
      }

      return restaurantsDetails;
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
        categoriesList.add(Category.fromMap(map, snapshot.id));
      }

      return categoriesList;
    }on FirebaseException {
      rethrow;
    }
  }
}