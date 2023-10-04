import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafr_aldawar_restaurants/shared/global.dart';

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
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<RestaurantsBloc, RestaurantsState>(
      builder: (context, state) {
        return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: size.height * 0.45,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        SizedBox(height: size.height * 0.04),

                        state.runtimeType == AllDataFetchingSuccessfulState?
                        ImagesSlider(restaurants: myRestaurants) : const ShimmerSlider(),
                        SizedBox(height: size.height * 0.01),

                        // search bar + drawer + filter //0.08
                        SizedBox(
                          height: size.height * 0.08,
                          width: size.width * 0.9,
                          child: TextField(
                            controller: _searchController,
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
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    _searchController.clear();
                                  });
                                  BlocProvider.of<RestaurantsBloc>(context).add(
                                      GetListOfRestaurantsBySearchEvent(searchText: null));
                                },
                                icon: const Icon(Icons.clear),
                              )
                            ),
                            onChanged: (val) => BlocProvider.of<RestaurantsBloc>(context).add(
                                GetListOfRestaurantsBySearchEvent(searchText: val)),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),

                        // category list
                        Expanded(
                          child: state.runtimeType == AllDataFetchingSuccessfulState?
                          const CategoriesList() : const ShimmerList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (ctx, index) => state.runtimeType == AllDataFetchingSuccessfulState?
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.height * 0.01),
                      child: RestaurantCard(restaurant: showedRestaurants[index]),
                    ) : const ShimmerCard(),

                    childCount: state.runtimeType == AllDataFetchingSuccessfulState?
                    showedRestaurants.length : 10,
                  ),
                ),
              ],
            )
        );
  },
);
  }
}
