import 'dart:developer';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
class CustomCategoryIcon extends StatelessWidget {
  const CustomCategoryIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 66,
            width: 67,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: const Icon(Icons.local_pizza, size: 50),
          ),
          const Text(
            'بيتزا',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class CustomNumberContainer extends StatelessWidget {
  const CustomNumberContainer({
    super.key,
    required this.height,
    required this.width,
    required this.orangeColor,
  });

  final double height;
  final double width;
  final Color orangeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71 / 926 * height,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0xffD9D9D9),
      ),
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          const Text(
            '01211456345+',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
          ),
          const Spacer(
            flex: 4,
          ),
          GestureDetector(
            onTap: () {
              log('object');
            },
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: orangeColor,
                ),
                width: 90 / 428 * width,
                child: const Center(
                    child: Row(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Text('اتصال',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        Spacer(
                          flex: 2,
                        ),
                        Icon(Icons.phone, size: 28),
                        Spacer(
                          flex: 1,
                        )
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomLocationContainer extends StatelessWidget {
  const CustomLocationContainer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, right: 5, left: 5),
      child: Container(
        height: 71 / 926 * height,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Icon(Icons.location_on),
            Spacer(
              flex: 1,
            ),
            Text(
              'شارع الحدائق - بجوار بن الافندى',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            Spacer(
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}

class CustomButtonTapBar extends StatelessWidget {
  const CustomButtonTapBar({
    super.key,
    required TabController? tabController,
    required this.orangeColor,
    required this.size,
  }) : _tabController = tabController;

  final TabController? _tabController;
  final Color orangeColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      radius: 15,
      height: size.height * 0.08,
      contentPadding: EdgeInsets.all(size.height * 0.01),
      buttonMargin: EdgeInsets.all(size.height * 0.01),
      controller: _tabController,
      backgroundColor: orangeColor,
      unselectedBackgroundColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      labelStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      tabs: const [
        Tab(text: "منيو وصور"),
        Tab(text: "ارقام وبيانات"),
        Tab(text: "عروض واخبار"),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  final String imageUrl;

  const DetailPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'image',
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}