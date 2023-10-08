import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Testfle.dart';
import '../screen/home_screen.dart';


class BottomNavigationClass extends StatefulWidget {
  const BottomNavigationClass({Key? key}) : super(key: key);

  @override
  State<BottomNavigationClass> createState() => _BottomNavigationClassState();
}

class _BottomNavigationClassState extends State<BottomNavigationClass> {
  Widget? _child;
  final TextEditingController? searchController = TextEditingController();
  @override
  void initState() {
    _child = Testclass();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  FluidNavBar(
          icons: [
            FluidNavBarIcon(
                icon: Icons.home,
                backgroundColor: Color.fromRGBO(47, 110, 182, 10),
                extras: {"label": "Home"}),
            FluidNavBarIcon(
                icon: Icons.backpack,
                backgroundColor: Color.fromRGBO(47, 110, 182, 10),
                extras: {"label": "account"}),
            FluidNavBarIcon(
                icon: Icons.location_on,
                backgroundColor: Color.fromRGBO(47, 110, 182, 10),
                extras: {"label": "location"}),
            FluidNavBarIcon(
                icon: Icons.chat,
                backgroundColor: Color.fromRGBO(47, 110, 182, 10),
                extras: {"label": "chat"}),
            FluidNavBarIcon(
                icon: Icons.person,
                backgroundColor: Color.fromRGBO(47, 110, 182, 10),
                extras: {"label": "profile"}),
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(
            barBackgroundColor: Color.fromRGBO(47, 110, 182, 10),
              iconSelectedForegroundColor: Colors.white,
              iconUnselectedForegroundColor: Colors.white),
          scaleFactor: 1.5,
          defaultIndex: 0,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!["label"],
            child: item,
          )
    );
  }


  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = Testclass();
          break;
        case 1:
          _child = Testclass();
          break;
        case 2:
          _child = Testclass();
          break;
        case 3:
          _child = Testclass();
          break;
        case 4:
          _child = Testclass();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 50),
        child: _child,

      );
    });
  }
}
