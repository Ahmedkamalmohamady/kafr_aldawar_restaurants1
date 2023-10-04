import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import 'favourite_screen.dart';
import 'home.dart';
import 'setting.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  List<Widget> pageList = [const Home(), const FavouriteScreen(), const Setting()];


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: pageList[_currentIndex],
        extendBody: true,
        bottomNavigationBar: DotNavigationBar(
          paddingR: const EdgeInsets.all(5),
          enablePaddingAnimation: false,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          dotIndicatorColor: Colors.transparent,
          backgroundColor: primary.withOpacity(0.6),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          items: [
            DotNavigationBarItem(
                icon: const Icon(Icons.home),
            ),
            DotNavigationBarItem(
                icon: const Icon(Icons.favorite),
            ),
            DotNavigationBarItem(
                icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
