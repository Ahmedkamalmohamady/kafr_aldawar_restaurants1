part of 'restaurants_bloc.dart';

@immutable
abstract class RestaurantsEvent {}

class RestaurantsInitialFetchEvent extends RestaurantsEvent{}

class CategoriesInitialFetchEvent extends RestaurantsEvent{}

class AllDataFetchEvent extends RestaurantsEvent{}

class AddRestaurantToFavouritesEvent extends RestaurantsEvent{
  final String restaurantId;
  AddRestaurantToFavouritesEvent({required this.restaurantId});
}

class RemoveRestaurantFromFavouritesEvent extends RestaurantsEvent{
  final String restaurantId;
  RemoveRestaurantFromFavouritesEvent({required this.restaurantId});
}

class GetListOfRestaurantsForCategoryEvent extends RestaurantsEvent{
  final String? categoryId;
  GetListOfRestaurantsForCategoryEvent({required this.categoryId});
}

class GetListOfRestaurantsBySearchEvent extends RestaurantsEvent{
  final String? searchText;
  GetListOfRestaurantsBySearchEvent({required this.searchText});
}