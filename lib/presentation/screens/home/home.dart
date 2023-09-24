import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/restaurants/restaurants_bloc.dart';

import '../../widgets/restaurant/restaurant_card.dart';
import '../../widgets/restaurant/shimmer_card.dart';

import '../../widgets/categories_list/shimmer_list.dart';
import '../../widgets/categories_list/categories_list.dart';

import '../../widgets/slider/image_slider.dart';
import '../../widgets/slider/shimmer_slider.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.46,
            backgroundColor: Theme.of(context).colorScheme.background,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(height: size.height * 0.035),

                  BlocBuilder<RestaurantsBloc, RestaurantsState>(
                    builder: (ctx, state) =>
                      state.runtimeType == RestaurantsFetchingSuccessfulState ?
                      const ImagesSlider() : const ShimmerSlider()
                  ),
                  SizedBox(height: size.height * 0.01),

                  // search bar + drawer + filter //0.08
                  SizedBox(
                    height: size.height * 0.08,
                    child: TextField(
                      //controller: _typeController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        labelText: 'بحث شامل ...',
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                        prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),

                  // category list
                  Expanded(
                    child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
                        builder: (ctx, state) =>
                        state.runtimeType == RestaurantsFetchingSuccessfulState ?
                        const CategoriesList() : const ShimmerList()
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, index) => BlocBuilder<RestaurantsBloc, RestaurantsState>(
                builder: (ctx, state) {
                  switch(state.runtimeType) {
                    case RestaurantsFetchingLoadingState:
                      return const ShimmerCard();
                    case RestaurantsFetchingSuccessfulState:
                      final successState = state as RestaurantsFetchingSuccessfulState;
                      return RestaurantCard(restaurant: successState.restaurants[index]);
                    default:
                      return const ShimmerCard();
                  }
                }
            ),
              childCount: 20,
            ),
          ),
        ],
      )
    );
  }
}
