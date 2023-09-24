import 'package:flutter/material.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
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
                  child: SizedBox(height: size.height * 0.08),
                )
            ),
            const Text('تصنيف')
          ],
        ),
      ),
    );
  }
}