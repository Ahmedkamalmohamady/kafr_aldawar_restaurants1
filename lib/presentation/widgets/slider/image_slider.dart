import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/models/restaurant_model.dart';

class ImagesSlider extends StatelessWidget {
  final List<RestaurantDetails> restaurants;
  const ImagesSlider({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CarouselSlider.builder(
      itemCount: restaurants.length,
      itemBuilder: (_, index, realIndex) => Stack(
          children: [
            SizedBox(
                height: size.height * 0.18,
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      restaurants[index].coverUrl, fit: BoxFit.cover,
                      loadingBuilder: (_, __, ___) {
                        if (___ == null) return __;
                        return const CircularProgressIndicator();
                      },
                      errorBuilder: (_, __, ___) => const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.broken_image,
                          size: 100,
                        ),
                      ),
                    ),
                )
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: size.height * 0.07,
                  height: size.height * 0.07,
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
