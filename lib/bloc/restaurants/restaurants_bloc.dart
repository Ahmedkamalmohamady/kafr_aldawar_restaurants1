import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kafr_aldawar_restaurants/repos/restaurants_firebase.dart';
import 'package:meta/meta.dart';

import '../../models/restaurant_model.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  RestaurantsBloc() : super(RestaurantsInitial()) {
    on<RestaurantsInitialFetchEvent>(restaurantsInitialFetchEvent);
  }

  FutureOr<void> restaurantsInitialFetchEvent(
      RestaurantsInitialFetchEvent event, Emitter<RestaurantsState> emit) async {

    emit(RestaurantsFetchingLoadingState());

    List<RestaurantForCard> restaurants = await RestaurantsFirebaseManger.getRestaurants();

    emit(RestaurantsFetchingSuccessfulState(restaurants: restaurants));
  }
}
