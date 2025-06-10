import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../data/models/user_profile.dart';
import '../features/home.dart';
import '../features/profile.dart';
import '../features/suggestions.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int cur_index = 0;
  PageController pagecontroller = PageController(initialPage: 0);
  final navigation_items = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: "Home",
        backgroundColor: scaffoldBackgroundColor
    ),
    // BottomNavigationBarItem(
    //     icon: const Icon(Icons.insights),
    //     label: "Insights",
    //     // backgroundColor: scaffoldBackgroundColor
    // ),
    BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: "Profile",
        backgroundColor: scaffoldBackgroundColor
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pagecontroller,
        onPageChanged: (newindex) {
          setState(() {
            cur_index = newindex;
          });
        },
        children: [
          HomeScreen(),
          ProfileScreen(profile: defaultUser),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: cur_index,
          // fixedColor: Colors.white,
          items: navigation_items,
          onTap: (newIndex) {
            setState(() {
              pagecontroller.animateToPage(newIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            });
          }),
    );
  }
}