import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widget/common_widget/character_list_widget.dart';
import 'package:provider/provider.dart';

import '../../navigation/auto_route.dart';
import '../favorite_widget/empty_favorite_widget.dart';
import '../favorite_view_model/favourite_view_model.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteViewModel = context.read<FavouriteViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Избранное',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: favouriteViewModel.favourites,
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null || data.isEmpty == true) {
              return const EmptyFavouriteWidget();
            }
            return CharacterListWidget(characters: data);
          }),
    );
  }
}


