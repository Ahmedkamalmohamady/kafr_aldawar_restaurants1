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
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: CarouselSlider.builder(
          itemCount: 0,
          itemBuilder: (_, index, realIndex) => Stack(
              children: [
                SizedBox(width: size.width, height: size.height * 0.15,),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(width: size.width * 0.1, height: size.height * 0.1,)
                ),
              ]
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
