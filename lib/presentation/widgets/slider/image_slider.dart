import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/models/restaurant_model.dart';

class ImagesSlider extends StatelessWidget {
  final List<RestaurantForCard> restaurants;
  const ImagesSlider({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CarouselSlider.builder(
      itemCount: restaurants.length,
      itemBuilder: (_, index, realIndex) => Stack(
          children: [
            SizedBox(
                height: size.height * 0.15,
                width: size.width,
                child: Image.network(restaurants[index].coverUrl, fit: BoxFit.cover,)
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: size.height * 0.05,
                  height: size.height * 0.05,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(restaurants[index].logoImageUrl, fit: BoxFit.cover,)),
                )
            ),
          ]
      ),
      options: CarouselOptions(
        height: size.height * .2,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
