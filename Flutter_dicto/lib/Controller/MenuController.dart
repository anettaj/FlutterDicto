import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MenuPannelController extends GetxController {
  var userName = 'User'.obs; // Reactive variable
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void onInit() {
    super.onInit();
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    sideMenu.dispose();
    pageController.dispose();
    super.dispose();
  }
}
