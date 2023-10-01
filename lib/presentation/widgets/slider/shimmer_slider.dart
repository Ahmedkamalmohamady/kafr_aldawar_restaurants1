import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSlider extends StatelessWidget {
  const ShimmerSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.2,
      width: size.width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[300]!,
        child: CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (_, index, realIndex) => Card(
            child: SizedBox(width: size.width, height: size.height * 0.2,),
          ),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
      ),
    );
  }
}
