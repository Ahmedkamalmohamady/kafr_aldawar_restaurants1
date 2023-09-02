
import 'package:flutter/material.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
          children: [

            SizedBox(height: size.height * 0.06),

            SizedBox(height: size.height * 0.02),
            Text('التصنيفات', style: Theme.of(context).textTheme.titleLarge),

            SizedBox(height: size.height * 0.02),
            const Text('هذه معظم التصنيفات المتوفرة', style: TextStyle(fontSize: 15, color: Colors.grey),),

            SizedBox(height: size.height * 0.02),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 0.2, childAspectRatio: 0.2,
                    crossAxisSpacing: 10, mainAxisSpacing: 10,
                    mainAxisExtent: 0.2
                ),
                itemBuilder: (ctx, index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: size.height * 0.08,
                      height: size.height * 0.08,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //color: Theme.of(context).focusColor,
                      ),
                      child: Image.asset('images/categories/hamburger.png'),
                    ),
                    const Text('بيتزا')
                  ],
                ),
                itemCount: 20,
                padding: EdgeInsets.all( size.height * 0.01),
              ),
            ),
          ]
      ),
    );
  }
}
