import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screen_catalog/catalog_view/catalog_view.dart';
import 'package:flutter_project/screen_product_card/product_view/product_card.dart';
import 'package:flutter_project/screen_showcase/showcase_view/showcase_screen.dart';
import '../domain/model/character.dart';
import '../screen_cart/cart_view/cart_view.dart';
import '../screen_favorite/favorite_view/favorite_view.dart';
import '../screen_main/main_view/main_screen.dart';
import '../screen_profile/profile_view/code_view.dart';
import '../screen_profile/profile_view/enter_view.dart';
import '../screen_profile/profile_view/profile_view.dart';

part 'auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CodeRoute.page),
        AutoRoute(page: EnterRoute.page),
        AutoRoute(
          page: MainRouteWidget.page,
          initial: true,
          children: [
            AutoRoute(
              page: ShowcaseTab.page,
              children: [AutoRoute(page: ShowcaseRoute.page, initial: true)],
            ),
            AutoRoute(
              page: CatalogTab.page,
              children: [
                AutoRoute(page: CatalogRoute.page, initial: true),
                AutoRoute(page: CharacterCardRoute.page),
              ],
            ),
            AutoRoute(
              page: CartTab.page,
              children: [AutoRoute(page: CartRoute.page, initial: true)],
            ),
            AutoRoute(
              page: FavoriteTab.page,
              children: [
                AutoRoute(page: FavoriteRoute.page, initial: true),
                AutoRoute(page: CharacterCardRoute.page),
              ],
            ),
            AutoRoute(
              page: ProfileTab.page,
              children: [
                AutoRoute(
                  page: ProfileRoute.page,
                  initial: true,
                ),
              ],
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'ShowcaseTab')
class ShowcaseTabPage extends AutoRouter {
  const ShowcaseTabPage({super.key});
}

@RoutePage(name: 'CatalogTab')
class CatalogTabPage extends AutoRouter {
  const CatalogTabPage({super.key});
}

@RoutePage(name: 'CartTab')
class CartTabPage extends AutoRouter {
  const CartTabPage({super.key});
}

@RoutePage(name: 'FavoriteTab')
class FavoriteTabPage extends AutoRouter {
  const FavoriteTabPage({super.key});
}

@RoutePage(name: 'ProfileTab')
class ProfileTabPage extends AutoRouter {
  const ProfileTabPage({super.key});
}
