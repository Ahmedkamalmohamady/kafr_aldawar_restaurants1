
import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';
import '../../../data/repos/restaurants_firebase.dart';

class ChooseCategories extends StatefulWidget {
  const ChooseCategories({Key? key}) : super(key: key);

  @override
  State<ChooseCategories> createState() => _ChooseCategoriesState();
}

class _ChooseCategoriesState extends State<ChooseCategories> {

  List<Category> categoryList = [];

  @override
  void initState() async{
    categoryList = await RestaurantsFirebaseManger.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.03),

          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).shadowColor,),
          ),

          SizedBox(height: size.height * 0.02),

          Text('Choose Categories', style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: size.height * 0.02),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(size.height * 0.01),
              itemBuilder: (ctx, index) => Card(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 5 / 3,
              ),
            )
          ),

          SizedBox(height: size.height * 0.02),
          //add or cancel
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: SizedBox(
                      height: size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 0,
                          backgroundColor: Theme.of(context).focusColor,
                          foregroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('cancel'),
                      )
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: SizedBox(
                    height: size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('Add'),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
