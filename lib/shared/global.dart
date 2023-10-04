
import '../bloc/restaurants/restaurants_bloc.dart';
import '../data/models/category_model.dart';
import '../data/models/restaurant_model.dart';


RestaurantsBloc restaurantsBloc = RestaurantsBloc();

List<Category> myCategories = [];
List<Category> showedCategories = [];

List<RestaurantDetails> myRestaurants = [];
List<RestaurantDetails> showedRestaurants = [];

List<RestaurantDetails> favRestaurants = [];
List<String> favRestaurantsIds = [];