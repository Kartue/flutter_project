import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/model/character.dart';
import '../../screen_favorite/favorite_view_model/favourite_view_model.dart';

class FavoriteLike extends StatelessWidget {
  const FavoriteLike({
    super.key,
    required this.favouriteViewModel,
    required this.character,
  });

  final FavouriteViewModel favouriteViewModel;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: favouriteViewModel.favourites,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return const Icon(
            Icons.favorite_border,
          );
        }
        if (data.contains(character)) {
          return IconButton(
            icon: const Icon(Icons.favorite,
              color:Colors.red,
            ),
            onPressed: () {
              favouriteViewModel.removeToFavourite(character);
            },
          );
        }
        return IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            favouriteViewModel.addToFavourite(character);
          },
        );
      },
    );
  }
}
