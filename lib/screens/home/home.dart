
import 'package:flutter/material.dart';

import '../../widgets/image_slider.dart';
import '../../widgets/restaurant_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.46,
            backgroundColor: Theme.of(context).colorScheme.background,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(height: size.height * 0.04),

                  const ImagesSlider(),
                  SizedBox(height: size.height * 0.02),

                  // search bar + drawer + filter
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.notes),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Expanded(
                        child: SizedBox(
                          height: size.height * 0.07,
                          child: const TextField(
                            //controller: _typeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              labelText: 'بحث شامل ...',
                              //labelStyle: Theme.of(context).textTheme.bodySmall,
                              prefixIcon: Icon(Icons.search, ),//color: Theme.of(context).primaryColor,),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.filter_list),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),

                  // category list
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (ctx, index) => Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.all(size.height * 0.01),
                                width: size.height * 0.09,
                                height: size.height * 0.07,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  //color: Theme.of(context).focusColor,
                                ),
                                child: Image.asset('assets/images/categories/pizza.png', fit: BoxFit.contain,),
                              ),
                              const Text('بيتزا')
                            ],
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: size.height * 0.01)
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            const RestaurantCard(),
            SizedBox(height: size.height * 0.02),

            const RestaurantCard(),
            SizedBox(height: size.height * 0.02),

            const RestaurantCard(),
            SizedBox(height: size.height * 0.02),

            const RestaurantCard(),
            SizedBox(height: size.height * 0.02),

            const RestaurantCard(),
            SizedBox(height: size.height * 0.02),

            const RestaurantCard(),
            SizedBox(height: size.height * 0.02),
          ]),),
        ],
      )
    );
  }
}
