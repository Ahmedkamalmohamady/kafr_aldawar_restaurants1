import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafr_aldawar_restaurants/bloc/restaurants/restaurants_bloc.dart';
import 'package:kafr_aldawar_restaurants/shared/global.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {

  bool choosed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: showedCategories.length,
      itemBuilder: (ctx, index) => InkWell(
        onTap: (){
          if(choosed){
            setState(() {
              choosed = false;
            });
            BlocProvider.of<RestaurantsBloc>(context).add(
                GetListOfRestaurantsForCategoryEvent(categoryId: null));
          }else {
            setState(() {
              choosed = true;
            });
            BlocProvider.of<RestaurantsBloc>(context).add(
                GetListOfRestaurantsForCategoryEvent(categoryId: showedCategories[index].title));
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: choosed ? Colors.green : null,
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: Image.network(
                      showedCategories[index].logoUrl,
                      height: size.height * 0.07),
                )
            ),
            Text(showedCategories[index].title)
          ],
        ),
      ),
    );
  }
}
