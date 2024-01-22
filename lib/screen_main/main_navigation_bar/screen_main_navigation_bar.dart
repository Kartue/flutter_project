import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../navigation/auto_route.dart';

class NavTabBar extends StatelessWidget {
  const NavTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: false,
      routes: const [
        ShowcaseTab(),
        CatalogTab(),
        CartTab(),
        FavoriteTab(),
        ProfileTab(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: "showcase",
              activeIcon:Column(
                children: [
                  Icon(
                    Icons.border_all,
                    color: Colors.black,
                  ),
                  Text(
                    "Витрина",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              icon: Column(
                children: [
                  Icon(
                    Icons.border_all,
                    color: Colors.grey,
                  ),
                  Text(
                    "Витрина",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              label: "catalog",
              activeIcon:Column(
                children: [
                  Icon(
                    Icons.window,
                    color: Colors.black,
                  ),
                  Text(
                    "Каталог",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              icon: Column(
                children: [
                  Icon(
                    Icons.window,
                    color: Colors.grey,
                  ),
                  Text(
                    "Каталог",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              label: "cart",
              activeIcon:Column(
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    "Корзина",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              icon: Column(
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    "Корзина",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              label: "fav",
              activeIcon:Column(
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    "Избранное",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              icon: Column(
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    "Избранное",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              label: "profile",
              activeIcon:Column(
                children: [
                  Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black,
                  ),
                  Text(
                    "Профиль",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              icon: Column(
                children: [
                  Icon(
                    Icons.person_outline_rounded,
                    color: Colors.grey,
                  ),
                  Text(
                    "Профиль",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color:Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
