import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: SizedBox(
                height: size.height * 0.1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const SizedBox(),
                ),
              )
          ),
          Expanded(
              flex: 8,
              child: SizedBox(
                height: size.height * 0.1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ListTile(
                      contentPadding: EdgeInsets.all(size.width * 0.02),
                      title: const Text('اسم المطعم', overflow: TextOverflow.ellipsis, softWrap: false, maxLines: 1,),
                      subtitle: const Text('التصنيفات', overflow: TextOverflow.ellipsis, softWrap: false, maxLines: 1,),
                      trailing: Icon(Icons.favorite_border, color: primary,)
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
