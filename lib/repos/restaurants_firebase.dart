import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/restaurant_model.dart';

class RestaurantsFirebaseManger {

  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<RestaurantForCard>> getRestaurants() async {

    QuerySnapshot snapshots;
    try{
      snapshots = await FirebaseFirestore.instance.collection('Restaurants').get();

      List<RestaurantForCard> mapList = [];

      for (var snapshot in snapshots.docs){
        final map = snapshot.data() as Map<String, dynamic>;
        mapList.add(RestaurantForCard.fromMap(map));
      }

      return mapList;
    }on FirebaseException {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getRestaurant(String restaurantId) async {
    DocumentSnapshot doc;
    try{
      doc = await FirebaseFirestore.instance
          .collection('Restaurants')
          .doc(restaurantId)
          .get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        throw('something wont wrong');
      }
    }on FirebaseException {
      rethrow;
    }
  }
}