import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../bloc/restaurants/restaurants_bloc.dart';
import '../../../data/models/restaurant_model.dart';
import '../../../shared/global.dart';

class DetailsScreen extends StatefulWidget {
  final RestaurantDetails restaurant;
  const DetailsScreen({super.key, required this.restaurant});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with SingleTickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RestaurantDetails restaurant = widget.restaurant;
    Color color = Theme.of(context).primaryColor;
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    forceElevated: innerBoxIsScrolled,
                    automaticallyImplyLeading: false,
                    expandedHeight: size.height * 0.34,
                    backgroundColor: Theme
                        .of(context)
                        .scaffoldBackgroundColor,
                    flexibleSpace: FlexibleSpaceBar(
                      background: SizedBox(
                        width: size.width,
                        height: size.height * 0.3,
                        child: Stack(
                            children: [
                              SizedBox(
                                width: size.width,
                                height: size.height * 0.3,
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(15)),
                                    child: Image.network(
                                      restaurant.coverUrl, fit: BoxFit.cover,)
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: size.width * 0.05,
                                child: SizedBox(
                                  width: size.height * 0.12,
                                  height: size.height * 0.12,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Hero(
                                      tag: restaurant.restaurantId,
                                      child: Image.network(
                                        restaurant.logoImageUrl,
                                        fit: BoxFit.cover,),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: size.width * 0.3,
                                child: Row(
                                  children: [
                                    Text(restaurant.title, style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge,),
                                    SizedBox(width: size.width * 0.05,),
                                    IconButton(
                                      onPressed: () {
                                        restaurant.fav
                                            ? BlocProvider.of<RestaurantsBloc>(context).add(RemoveRestaurantFromFavouritesEvent(restaurantId: restaurant.restaurantId))
                                            : BlocProvider.of<RestaurantsBloc>(context).add(AddRestaurantToFavouritesEvent(restaurantId: restaurant.restaurantId));
                                      },
                                      icon: Icon(restaurant.fav
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  Center(
                    child: ButtonsTabBar(
                      controller: _tabController,
                      radius: 15,
                      height: size.height * 0.13,
                      contentPadding: EdgeInsets.all(size.height * 0.01),
                      buttonMargin: EdgeInsets.all(size.height * 0.03),
                      backgroundColor: color,
                      unselectedBackgroundColor: Colors.grey,
                      labelStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                      tabs: const [
                        Tab(text: "منيو وصور"),
                        Tab(text: "ارقام وبيانات"),
                        Tab(text: "عروض واخبار"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(size.height * 0.02,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if(restaurant.menuImagesList.isNotEmpty) ...[
                                  Text('المنيو', style: Theme.of(context).textTheme.titleLarge,),
                                  SizedBox(
                                    height: size.height * 0.25,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: restaurant.menuImagesList.length,
                                        separatorBuilder: (_, __) =>
                                            Padding(padding: EdgeInsets.all(
                                                size.height * 0.01),),
                                        itemBuilder: (ctx, index) =>
                                            Image.network(
                                              restaurant.menuImagesList[index],
                                              height: size.height * 0.25,
                                              width: size.width * 0.3,
                                              fit: BoxFit.cover,
                                            )
                                    ),
                                  )],

                                if(restaurant.restaurantImagesList.isNotEmpty) ...[
                                  Text('المطعم', style: Theme.of(context).textTheme.titleLarge,),
                                  SizedBox(
                                    height: size.height * 0.25,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: restaurant.restaurantImagesList.length,
                                        separatorBuilder: (_, __) =>
                                            Padding(padding: EdgeInsets.all(
                                                size.height * 0.01),),
                                        itemBuilder: (ctx, index) =>
                                            Image.network(
                                              restaurant.restaurantImagesList[index],
                                              height: size.height * 0.25,
                                              width: size.width * 0.3,
                                              fit: BoxFit.cover,
                                            )
                                    ),
                                  )],

                                Center(child: Text('اخر تحديث في ${restaurant.lastUpdate!.toString()}', style: Theme.of(context).textTheme.titleLarge,)),
                              ],
                            ),
                          ),
                        ),

                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(size.height * 0.02,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('الفروع', style: Theme.of(context).textTheme.titleLarge,),
                                ...
                                restaurant.branches.map((branch) => Card(
                                  child: ExpansionTile(
                                    childrenPadding: EdgeInsets.all(size.height * 0.01),
                                    title: Text(branch.address, style: Theme.of(context).textTheme.titleLarge,),
                                    children: [
                                      ListTile(
                                        title: Text(branch.phoneNumber, style: Theme.of(context).textTheme.titleLarge,),
                                        trailing: InkWell(
                                          onTap: () => launchUrl(Uri.parse('tel:+2${branch.phoneNumber}')),
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Theme.of(context).focusColor,
                                            child: const Icon(Icons.phone),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )).toList(),

                                if(restaurant.features.isNotEmpty) ...[
                                  Text('المميزات', style: Theme.of(context).textTheme.titleLarge,),
                                  SizedBox(
                                    height: size.height * 0.15,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: (ctx, index) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Card(
                                              child: Padding(
                                                padding: EdgeInsets.all(size.height * 0.01),
                                                child: Image.network(myCategories[index].logoUrl, height: size.height * 0.07),
                                              )
                                          ),
                                          Text(myCategories[index].title)
                                        ],
                                      ),
                                    ),
                                  )],

                                Text('التصنيفات', style: Theme.of(context).textTheme.titleLarge,),
                                SizedBox(
                                  height: size.height * 0.15,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (ctx, index) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Card(
                                            child: Padding(
                                              padding: EdgeInsets.all(size.height * 0.01),
                                              child: Image.network(myCategories[index].logoUrl, height: size.height * 0.07),
                                            )
                                        ),
                                        Text(myCategories[index].title)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Center(
                          child: Text('انتظر العروض قريبا ', style: Theme
                              .of(context)
                              .textTheme
                              .headlineMedium),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}