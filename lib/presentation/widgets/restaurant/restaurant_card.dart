import 'package:flutter/material.dart';

import '../../../data/models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantForCard restaurant;
  const RestaurantCard({super.key, required this.restaurant});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: SizedBox(
                  height: size.height * 0.1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                        tag: restaurant.restaurantId,
                        child: Image.network(restaurant.logoImageUrl)),
                  ),
                )
            ),
            Expanded(
                flex: 8,
                child: SizedBox(
                  height: size.height * 0.1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20)
                    ),
                    child: ListTile(
                        contentPadding: EdgeInsets.all(size.width * 0.02),
                        title: Row(
                          children: [
                            Text(restaurant.title, overflow: TextOverflow.ellipsis, softWrap: false, maxLines: 1,),
                            Icon(Icons.done, color: Theme.of(context).primaryColor,)
                          ],
                        ),
                        subtitle: Text(restaurant.categories.toString(), overflow: TextOverflow.ellipsis, softWrap: false, maxLines: 1,),
                        trailing: Icon(Icons.favorite_border, color: Theme.of(context).primaryColor,)
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
