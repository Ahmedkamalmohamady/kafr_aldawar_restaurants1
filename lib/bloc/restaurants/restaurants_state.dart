part of 'restaurants_bloc.dart';

@immutable
abstract class RestaurantsState {}

class RestaurantsInitial extends RestaurantsState {}

class RestaurantsFetchingLoadingState extends RestaurantsState {}

class RestaurantsFetchingErrorState extends RestaurantsState {}

class RestaurantsFetchingSuccessfulState extends RestaurantsState {
  final List<RestaurantForCard> restaurants;

  RestaurantsFetchingSuccessfulState({
    required this.restaurants,
  });
}

class CategoriesInitial extends RestaurantsState {}

class CategoriesFetchingLoadingState extends RestaurantsState {}

class CategoriesFetchingErrorState extends RestaurantsState {}

class CategoriesFetchingSuccessfulState extends RestaurantsState {
  final List<Category> categoriesList;

  CategoriesFetchingSuccessfulState({
    required this.categoriesList,
  });
}