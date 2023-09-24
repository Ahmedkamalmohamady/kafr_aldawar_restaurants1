import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/restaurant_model.dart';
import '../../data/models/category_model.dart';
import '../../data/repos/restaurants_firebase.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  RestaurantsBloc() : super(RestaurantsInitial()) {
    on<CategoriesInitialFetchEvent>(categoriesInitialFetchEvent);
    on<RestaurantsInitialFetchEvent>(restaurantsInitialFetchEvent);
  }

  FutureOr<void> restaurantsInitialFetchEvent(
      RestaurantsInitialFetchEvent event, Emitter<RestaurantsState> emit) async {

    emit(RestaurantsFetchingLoadingState());

    List<RestaurantForCard> restaurants = await RestaurantsFirebaseManger.getRestaurants();

    emit(RestaurantsFetchingSuccessfulState(restaurants: restaurants));
  }

  FutureOr<void> categoriesInitialFetchEvent(
      CategoriesInitialFetchEvent event, Emitter<RestaurantsState> emit) async {

    emit(CategoriesFetchingLoadingState());

    List<Category> categoriesList = await RestaurantsFirebaseManger.getCategories();

    emit(CategoriesFetchingSuccessfulState(categoriesList: categoriesList));
  }
}
