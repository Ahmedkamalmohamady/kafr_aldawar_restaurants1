import 'package:flutter/material.dart';
import 'package:kafr_aldawar_restaurants/presentation/screens/details/details_screen.dart';

import '../../../data/models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantDetails restaurant;
  const RestaurantCard({super.key, required this.restaurant});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsScreen(restaurant: restaurant))
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.01),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: size.height * 0.12,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Hero(
                        tag: restaurant.restaurantId,
                        child: Image.network(restaurant.logoImageUrl, fit: BoxFit.cover)),
                    ),
                  )
              ),
              Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: size.height * 0.12,
                    child: ListTile(
                        contentPadding: EdgeInsets.all(size.width * 0.01),
                        title: Row(
                          children: [
                            Text(restaurant.title, overflow: TextOverflow.ellipsis, softWrap: false, maxLines: 1,),
                            SizedBox(width: size.width * 0.01),
                            Image.asset('assets/images/setting/verified.png',
                              height: size.height * 0.025, width: size.height * 0.025
                            ),
                          ],
                        ),
                        subtitle: Text(restaurant.categories.join(', '), overflow: TextOverflow.ellipsis, softWrap: false, maxLines: 1,),
                        //trailing: Icon(Icons.favorite_border, color: Theme.of(context).primaryColor,)
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
