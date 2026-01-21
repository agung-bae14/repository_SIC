import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sic/controllers/page_index_controller.dart';
import 'package:sic/modules/home/views/home_page.dart';
import 'package:sic/modules/presensi/views/presensi_page.dart';
import 'package:sic/modules/profile/views/profile_page.dart';

class MainWrapper extends StatelessWidget {

  final PageIndexController pageController = Get.put(PageIndexController());

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Theme.of(context).primaryColor,
              color: Colors.grey[600]!,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.edit_calendar,
                  text: 'Presensi',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: pageController.pageIndex.value,
              onTabChange: (index) {
                pageController.changePage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}