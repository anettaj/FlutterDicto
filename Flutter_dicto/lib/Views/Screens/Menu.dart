import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../Controller/MenuController.dart';
import '../Constant/Colors.dart';
import 'MobileTemplate.dart';
import 'MobileWidgets.dart';
import 'WebTemplate.dart';

class  Menu extends StatelessWidget {
  Menu({super.key});
  final MenuPannelController menuController = Get.put(MenuPannelController());

  @override
  Widget build(BuildContext context) {
    double H = MediaQuery
        .of(context)
        .size
        .height;
    double W = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: Row(
        children: [
          // Side Menu Container
          SideMenu(
            alwaysShowFooter: false,
            // showToggle: true,
            collapseWidth: 40,
            controller: menuController.sideMenu,
            style: SideMenuStyle(
              // displayMode: SideMenuDisplayMode.auto,
              showHamburger: true,
              // displayMode: SideMenuDisplayMode.auto,
              decoration: BoxDecoration(),
              displayMode: SideMenuDisplayMode.auto,
              openSideMenuWidth: 250,
              hoverColor: GeneralColor,
              backgroundColor: BackgroundColor,
              selectedColor: Colors.transparent,
              selectedTitleTextStyle: TextStyle(
                  color: GeneralColor, fontWeight: FontWeight.bold),
              selectedIconColor: GeneralColor,
              unselectedIconColor: ThirdColor,
              unselectedTitleTextStyle: TextStyle(color: ThirdColor),
            ),

            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: DrawerSelectedColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 10),
                  child: Text(
                    'Developed by Anet Taj',
                    style: TextStyle(fontSize: 15, color: ThirdColor),
                  ),
                ),
              ),
            ),
            items: [
              SideMenuItem(
                title: 'Mobile Template',
                onTap: (index, _) {
                  menuController.sideMenu.changePage(index);
                },
                icon: const Icon(Icons.phone_android_rounded),
              ),
              SideMenuItem(
                title: 'Web Template',
                onTap: (index, _) {
                  menuController.sideMenu.changePage(index);
                },
                icon: const Icon(Icons.web),
              ),
              SideMenuItem(
                title: 'Full Widget',
                onTap: (index, _) {
                  menuController.sideMenu.changePage(index);
                },
                icon: const Icon(Icons.web),
              ),


            ],
          ),
          const VerticalDivider(width: 0),
          Expanded(
            child: PageView(
              controller: menuController.pageController,
              children: [
                MobileTemplate(),
                WebTemplate(),
                MobileWidgets(),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
