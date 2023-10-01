import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;
  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (ctx, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: Image.network(categories[index].logoUrl, height: size.height * 0.08),
                )
            ),
            Text(categories[index].title)
          ],
        ),
      ),
    );
  }
}
