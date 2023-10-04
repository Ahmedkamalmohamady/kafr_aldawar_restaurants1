
import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';
import '../../../shared/global.dart';

List<String> choosenCategories = [];

class ChooseCategories extends StatefulWidget {
  const ChooseCategories({Key? key}) : super(key: key);

  @override
  State<ChooseCategories> createState() => _ChooseCategoriesState();
}

class _ChooseCategoriesState extends State<ChooseCategories> {

  List<Category> categories = [];


  @override
  void initState(){
    categories = myCategories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),

            IconButton(
              onPressed: (){
                choosenCategories = [];
                Navigator.pop(context, null);
              },
              icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).shadowColor,),
            ),

            SizedBox(height: size.height * 0.02),

            Text('Choose Categories', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: size.height * 0.02),

            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                padding: EdgeInsets.all(size.height * 0.01),
                itemBuilder: (ctx, index) => CategoryWidget(size: size, category: categories[index]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
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
                            choosenCategories = [];
                            Navigator.pop(context, null);
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
                          Navigator.pop(context, choosenCategories);
                          choosenCategories = [];
                        },
                        child: const Text('Ok'),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
    //required this.context,
    required this.size,
    required this.category
  });

  //final BuildContext context;
  final Size size;
  final Category category;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool choosed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          if(choosed){
            choosed = false;
            choosenCategories.remove(widget.category.title);
          }else {
            choosed = true;
            choosenCategories.add(widget.category.title);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: choosed == true? Colors.green : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
                child: Padding(
                  padding: EdgeInsets.all(widget.size.height * 0.01),
                  child: Image.network(widget.category.logoUrl, height: widget.size.height * 0.08),
                )
            ),
            Text(widget.category.title)
          ],
        ),
      ),
    );
  }
}
