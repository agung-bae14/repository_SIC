import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_glass_navbar/liquid_glass_navbar.dart';
import 'package:sic/controllers/page_index_controller.dart';
import 'package:sic/modules/home/views/home_page.dart';
import 'package:sic/modules/presensi/views/presensi_page.dart';
import 'package:sic/modules/profile/views/profile_page.dart';

class MainWrapper extends StatelessWidget {
  final PageIndexController pageController = Get.put(PageIndexController());

  final List<Widget> _pages = [
    HomePage(),
    PresensiPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: pageController.pageIndex.value,
            children: [
              HomePage(),
              PresensiPage(),
              ProfilePage(),
            ],
          )),
      bottomNavigationBar: LiquidGlassNavBar(
        currentIndex: pageController.pageIndex.value,
        onPageChanged: (index) {
          pageController.changePage(index);
        },
        pages: _pages,
        items: [
          LiquidGlassNavItem(icon: Icons.home_filled, label: "Home"),
          LiquidGlassNavItem(icon: Icons.history, label: "History"),
          LiquidGlassNavItem(icon: Icons.person, label: "Profile"),
        ],
        backgroundColor: Color(0xff46b83d),
        itemColor: Colors.white,
        bubbleColor: Colors.white,
        blurStrength: 5,
        showBubble: true,
        enableDragging: true,
        elevation: 1,
        borderRadius: 20,
        bottomPadding: 30,
      ),
    );
  }
}
