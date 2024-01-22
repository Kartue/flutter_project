import 'package:flutter/material.dart';
import 'package:flutter_project/navigation/auto_route.dart';
import 'package:flutter_project/screen_cart/cart_view_model/cart_view_model.dart';
import 'package:flutter_project/screen_catalog/catalog_view_model/catalog_view_model.dart';
import 'package:flutter_project/screen_favorite/favorite_view_model/favourite_view_model.dart';
import 'package:flutter_project/screen_profile/profile_view_model/profile_view_model.dart';
import 'package:provider/provider.dart';


void main() {
  final appRouter = AppRouter();

  runApp(Provider<ProfileViewModel>(
    create: (BuildContext context) {
      return ProfileViewModel();
    },
      child: Provider<CatalogViewModel>(
        create: (BuildContext context) {
          return CatalogViewModel();
        },
          child: Provider<CartCharacterViewModel>(
            create: (BuildContext context) {
              return CartCharacterViewModel();
            },
            child: Provider<FavouriteViewModel>(
              create: (BuildContext context) {
                return FavouriteViewModel();
              },
              child: MaterialApp.router(
                routerDelegate: appRouter.delegate(
                  initialRoutes: [
                    const MainRouteWidget(),
                  ],
                ),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    ),
    ),
  ),
  );
}
