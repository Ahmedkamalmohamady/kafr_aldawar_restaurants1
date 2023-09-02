import 'package:flutter/material.dart';

import 'package:kafr_aldawar_restaurants/widgets/restaurant_card.dart';


class DiscountScreen extends StatelessWidget {
  const DiscountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height * 0.06),

        SizedBox(height: size.height * 0.02),
        Text('الخصومات', style: Theme.of(context).textTheme.titleLarge),

        SizedBox(height: size.height * 0.02),
        const Text('وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه', style: TextStyle(fontSize: 15, color: Colors.grey),),

        SizedBox(height: size.height * 0.02),

        Expanded(
          child: ListView.separated(
              itemBuilder: (ctx, index) => const RestaurantCard(),
              itemCount: 15,
              separatorBuilder: (ctx, index) => SizedBox(height: size.height * 0.01),
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.01)
          ),
        ),
      ],
    );
  }
}
