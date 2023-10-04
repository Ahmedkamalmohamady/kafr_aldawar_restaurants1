import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/restaurant_model.dart';
import '../../data/models/category_model.dart';
import '../../data/repos/restaurants_firebase.dart';
import '../../shared/constants.dart';
import '../../shared/global.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  RestaurantsBloc() : super(RestaurantsInitial()) {
    on<CategoriesInitialFetchEvent>(categoriesInitialFetchEvent);
    on<RestaurantsInitialFetchEvent>(restaurantsInitialFetchEvent);
    on<AllDataFetchEvent>(allDataFetchEvent);
    on<AddRestaurantToFavouritesEvent>(addRestaurantToFavouritesEvent);
    on<RemoveRestaurantFromFavouritesEvent>(removeRestaurantFromFavouritesEvent);
    on<GetListOfRestaurantsForCategoryEvent>(getListOfRestaurantsForCategoryEvent);
    on<GetListOfRestaurantsBySearchEvent>(getListOfRestaurantsBySearchEvent);

  }

  FutureOr<void> restaurantsInitialFetchEvent(
      RestaurantsInitialFetchEvent event, Emitter<RestaurantsState> emit) async {

    emit(RestaurantsFetchingLoadingState());

    List<RestaurantDetails> restaurants = await RestaurantsFirebaseManger.getRestaurantsDetails();

    emit(RestaurantsFetchingSuccessfulState(restaurants: restaurants));
  }

  FutureOr<void> categoriesInitialFetchEvent(
      CategoriesInitialFetchEvent event, Emitter<RestaurantsState> emit) async {

    emit(CategoriesFetchingLoadingState());

    List<Category> categoriesList = await RestaurantsFirebaseManger.getCategories();

    emit(CategoriesFetchingSuccessfulState(categoriesList: categoriesList));
  }

  FutureOr<void> allDataFetchEvent(AllDataFetchEvent event, Emitter<RestaurantsState> emit) async {
    emit(AllDataFetchingLoadingState());

    try{

      List<Category> categories = await RestaurantsFirebaseManger.getCategories();
      myCategories = categories;
      showedCategories = categories;

      favRestaurantsIds = sharedPreferences?.getStringList('favRestaurantsIds') ?? [];

      List<RestaurantDetails> restaurants = await RestaurantsFirebaseManger.getRestaurantsDetails();
      myRestaurants = restaurants;
      showedRestaurants = restaurants;

      favRestaurantsIds = sharedPreferences?.getStringList('favRestaurantsIds') ?? [];
      favRestaurantsIds.map((restaurantId) => favRestaurants.add(myRestaurants.firstWhere((element) => restaurantId == element.restaurantId)));

      emit(AllDataFetchingSuccessfulState(categories: categories, restaurants: restaurants));
    }catch(e){
      emit(AllDataFetchingErrorState(error: e.toString()));
    }

  }

  FutureOr<void> addRestaurantToFavouritesEvent(
      AddRestaurantToFavouritesEvent event, Emitter<RestaurantsState> emit) async {

    favRestaurantsIds = sharedPreferences?.getStringList('favRestaurantsIds') ?? [];
    favRestaurantsIds.add(event.restaurantId);
    sharedPreferences?.setStringList('favRestaurantsIds', favRestaurantsIds);

    favRestaurants.add(myRestaurants.firstWhere((element) => event.restaurantId == element.restaurantId));
    myRestaurants.firstWhere((res) => res.restaurantId == event.restaurantId).fav = true;

  }

  FutureOr<void> removeRestaurantFromFavouritesEvent(
      RemoveRestaurantFromFavouritesEvent event, Emitter<RestaurantsState> emit) async {
    favRestaurantsIds = sharedPreferences?.getStringList('favRestaurantsIds') ?? [];
    favRestaurantsIds.remove(event.restaurantId);
    sharedPreferences?.setStringList('favRestaurantsIds', favRestaurantsIds);

    favRestaurants.remove(myRestaurants.firstWhere((element) => event.restaurantId == element.restaurantId));
    myRestaurants.firstWhere((res) => res.restaurantId == event.restaurantId).fav = false;
  }

  FutureOr<void> getListOfRestaurantsForCategoryEvent(
      GetListOfRestaurantsForCategoryEvent event, Emitter<RestaurantsState> emit) async {
    if(event.categoryId == null){
      showedRestaurants =  myRestaurants;
      showedCategories = myCategories;
    }else{
      showedRestaurants = myCategories.firstWhere((category) => category.title == event.categoryId!).restaurantIdsList
          .map((resId) => myRestaurants.firstWhere((res) => res.restaurantId == resId)).toList();
      showedCategories = [myCategories.firstWhere((element) => element.title == event.categoryId!)];
    }
  }

  FutureOr<void> getListOfRestaurantsBySearchEvent(
      GetListOfRestaurantsBySearchEvent event, Emitter<RestaurantsState> emit) async {
    showedRestaurants = event.searchText == null ?
    myRestaurants :
    myRestaurants.where((res) => res.title.contains(event.searchText!)).toList();
  }

}
