import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/restaurants/restaurants_bloc.dart';
import '../../../shared/global.dart';
import '../../widgets/restaurant/restaurant_card.dart';
import '../../widgets/restaurant/shimmer_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<RestaurantsBloc, RestaurantsState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: EdgeInsets.all(size.height * 0.01,),
              child: Text('المفضلة', style: Theme.of(context).textTheme.headlineMedium),
            ),

            state.runtimeType == AllDataFetchingSuccessfulState
            ? favRestaurants.isEmpty

            ? Center(
              child: SvgPicture.asset('assets/images/svg/fav.svg', height: size.height * 0.5,),
            )

            : Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) => RestaurantCard(restaurant: favRestaurants[index]),
                itemCount: favRestaurants.length,
              ),
            )

            : Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) => const ShimmerCard(),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
