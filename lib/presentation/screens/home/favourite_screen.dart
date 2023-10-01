import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/restaurants/restaurants_bloc.dart';
import '../../widgets/restaurant/restaurant_card.dart';
import '../../widgets/restaurant/shimmer_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => RestaurantsBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.06),
          SizedBox(height: size.height * 0.02),
          Text('المطاعم المفضلة',
              style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: size.height * 0.02),
          const Text(
            'لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(height: size.height * 0.02),
          Expanded(
            child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
              builder: (ctx, state) {
                switch (state.runtimeType) {
                  case RestaurantsFetchingLoadingState:
                    return ListView.separated(
                        itemBuilder: (ctx, index) => const ShimmerCard(),
                        itemCount: 20,
                        separatorBuilder: (ctx, index) =>
                            SizedBox(height: size.height * 0.01),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.height * 0.01));
                  case RestaurantsFetchingSuccessfulState:
                    final successState =
                        state as RestaurantsFetchingSuccessfulState;
                    return ListView.separated(
                        itemBuilder: (ctx, index) => RestaurantCard(
                            restaurant: successState.restaurants[index]),
                        itemCount: successState.restaurants.length,
                        separatorBuilder: (ctx, index) =>
                            SizedBox(height: size.height * 0.01),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.height * 0.01));
                  default:
                    return Center(
                        child: SvgPicture.asset('assets/images/fav.svg',
                            height: 300));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
