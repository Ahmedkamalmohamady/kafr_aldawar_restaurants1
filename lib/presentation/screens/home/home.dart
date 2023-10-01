import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/restaurants/restaurants_bloc.dart';

import '../../widgets/restaurant/restaurant_card.dart';
import '../../widgets/restaurant/shimmer_card.dart';

import '../../widgets/categories_list/shimmer_list.dart';
import '../../widgets/categories_list/categories_list.dart';

import '../../widgets/slider/image_slider.dart';
import '../../widgets/slider/shimmer_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final RestaurantsBloc restaurantsBloc = RestaurantsBloc();
  
  @override
  void initState() {
    restaurantsBloc.add(CategoriesInitialFetchEvent());
    restaurantsBloc.add(RestaurantsInitialFetchEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
  create: (context) => restaurantsBloc,
  child: BlocConsumer<RestaurantsBloc, RestaurantsState>(
      listener: (context, state) {},
      builder: (context, state) {
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

                        state.runtimeType == RestaurantsFetchingSuccessfulState?
                        ImagesSlider(restaurants: (state as RestaurantsFetchingSuccessfulState).restaurants) :
                        const ShimmerSlider(),
                        SizedBox(height: size.height * 0.01),

                        // search bar + drawer + filter //0.08
                        SizedBox(
                          height: size.height * 0.08,
                          child: TextField(
                            //controller: _typeController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                              labelText: 'بحث شامل ...',
                              labelStyle: Theme.of(context).textTheme.bodySmall,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),

                        // category list
                        Expanded(
                          child: state.runtimeType == CategoriesFetchingSuccessfulState?
                          CategoriesList(categories: (state as CategoriesFetchingSuccessfulState).categoriesList) :
                          const ShimmerList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (ctx, index) => state.runtimeType == RestaurantsFetchingSuccessfulState?
                        RestaurantCard(restaurant: (state as RestaurantsFetchingSuccessfulState).restaurants[index]) :
                        const ShimmerCard(),

                    childCount: 10,
                  ),
                ),
              ],
            ));
      },
    ),
);
  }
}
