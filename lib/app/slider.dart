import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../features/home.dart';
import '../features/profile.dart';

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
    ),
    // BottomNavigationBarItem(
    //     icon: const Icon(Icons.insights),
    //     label: "Insights",
    // ),
    BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: "Profile",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pagecontroller,
        onPageChanged: (newIndex) {
          setState(() {
            cur_index = newIndex;
          });
        },
        children: [
          HomeScreen(),
          ProfileScreen(profile: defaultUser),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: cur_index,
          fixedColor: Color(0xFF007BFF),
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