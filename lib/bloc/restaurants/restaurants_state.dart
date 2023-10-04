part of 'restaurants_bloc.dart';

@immutable
abstract class RestaurantsState {}

class RestaurantsInitial extends RestaurantsState {}

class RestaurantsFetchingLoadingState extends RestaurantsState {}

class RestaurantsFetchingErrorState extends RestaurantsState {
  final String error;

  RestaurantsFetchingErrorState({required this.error});
}

class RestaurantsFetchingSuccessfulState extends RestaurantsState {
  final List<RestaurantDetails> restaurants;

  RestaurantsFetchingSuccessfulState({
    required this.restaurants,
  });
}

class CategoriesInitial extends RestaurantsState {}

class CategoriesFetchingLoadingState extends RestaurantsState {}

class CategoriesFetchingErrorState extends RestaurantsState {
  final String error;

  CategoriesFetchingErrorState({required this.error});
}

class CategoriesFetchingSuccessfulState extends RestaurantsState {
  final List<Category> categoriesList;

  CategoriesFetchingSuccessfulState({
    required this.categoriesList,
  });

}

class AllDataInitial extends RestaurantsState {}

class AllDataFetchingLoadingState extends RestaurantsState {}

class AllDataFetchingErrorState extends RestaurantsState {
  final String error;

  AllDataFetchingErrorState({required this.error});

}

class AllDataFetchingSuccessfulState extends RestaurantsState {
  final List<Category> categories;
  final List<RestaurantDetails> restaurants;

  AllDataFetchingSuccessfulState({
    required this.categories,
    required this.restaurants,
  });

}