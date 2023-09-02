import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {

  const RestaurantCard({super.key});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: SizedBox(
                  height: size.height * 0.1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20)
                    ),
                    child: Hero(
                        tag: 'Id',
                        child: Image.asset('assets/images/categories/drink.png')),
                    //Image.file(File('imageUrl'),fit: BoxFit.cover)),
                  ),
                )
            ),
            Expanded(
                flex: 8,
                child: SizedBox(
                  height: size.height * 0.1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20)
                    ),
                    child: Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(size.width * 0.02),
                        title: const Text('Restaurant Name', overflow: TextOverflow.ellipsis, softWrap: false, maxLines: 1,),
                        subtitle: const Text('Categories', overflow: TextOverflow.ellipsis, softWrap: false, maxLines: 1,),
                        trailing: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.favorite_border, color: Theme.of(context).primaryColor,),
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
