
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
                  SizedBox(height: size.height * 0.035),

                  const ImagesSlider(), //0.2
                  SizedBox(height: size.height * 0.01),

                  // search bar + drawer + filter //0.08
                  SizedBox(
                    height: size.height * 0.08,
                    child: Row(
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
                  ),
                  SizedBox(height: size.height * 0.01),

                  // category list
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (ctx, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(size.height * 0.01),
                                    child: Image.asset('assets/images/categories/pizza.png', height: size.height * 0.08),
                                  )
                              ),
                              const Text('بيتزا')
                            ],
                          ),
                        ),
                    ),
                  ),
                  //SizedBox(height: size.height * 0.01),
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
