import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/bootom_nav_controller.dart';
import 'package:shopping_app/pages/cart_page.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:shopping_app/pages/offers_page.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final List<Widget> _pages = [HomePage(), OfferPage(), CartPage()];

  final BottomNavController _bottomNavController =
      Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: NeumorphicColors.background,
          body: _pages[_bottomNavController.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/home.png',
                  width: 30,
                  height: 30,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/offer.png',
                  width: 30,
                  height: 30,
                ),
                label: "Offer",
              ),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/cart.png',
                    width: 30,
                    height: 30,
                  ),
                  label: "Cart"),
            ],
            currentIndex: _bottomNavController.selectedIndex,
            onTap: (index) {
              _bottomNavController.selectedIndex = index;
            },
          ),
        ));
  }
}
