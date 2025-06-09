import 'package:flutter/material.dart';
import 'package:fudiko/components/bottomnav.dart';
import 'package:fudiko/screens/others/nav/banquet.dart';
import 'package:fudiko/screens/others/nav/offers.dart';
import 'package:fudiko/screens/others/nav/profile.dart';
import 'package:fudiko/screens/others/nav/reservation.dart';
import 'package:fudiko/screens/others/nav/takeaway.dart';
class MainNavPage extends StatefulWidget {
  const MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    Reservation(),
    Banquet(),
    Offers(),
    TakeAway(),
    Profile()
  ];

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: Bottomnav(
        selectedIndex: currentIndex,
        onTabSelected: onTabChanged,
      ),
    );
  }
}
