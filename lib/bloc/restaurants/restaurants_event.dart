part of 'restaurants_bloc.dart';

@immutable
abstract class RestaurantsEvent {}

class RestaurantsInitialFetchEvent extends RestaurantsEvent{}

class CategoriesInitialFetchEvent extends RestaurantsEvent{}