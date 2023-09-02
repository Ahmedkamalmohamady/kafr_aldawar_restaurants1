import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {
  const ImagesSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.17,
      width: size.width,
      child: CarouselSlider.builder(
        itemCount: 0,
        itemBuilder: (_, index, realIndex) => Stack(
          children: [
            Image.asset('assets/images/categories/pizza.png', width: size.width, height: size.height * 0.16,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/categories/drink.png', width: size.width * 0.1, height: size.height * 0.1,)
            ),
          ]
        ),
        options: CarouselOptions(
          height: size.height * .3,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
