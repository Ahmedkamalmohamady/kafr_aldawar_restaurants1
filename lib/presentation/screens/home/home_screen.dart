import 'package:flutter/material.dart';

import 'favourite_screen.dart';
import 'home.dart';
import 'setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  List<Widget> pageList = [const Home(), const FavouriteScreen(), const Setting()];


  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'المضلة'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'الاعدادات'
            ),
          ],
        ),
      ),
    );
  }
}
