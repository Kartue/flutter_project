import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/navigation/auto_route.dart';
import 'package:flutter_project/widget/common_widget/to_cart_button.dart';
import 'package:provider/provider.dart';
import '../../domain/model/character.dart';
import '../../screen_cart/cart_view_model/cart_view_model.dart';
import '../../screen_favorite/favorite_view_model/favourite_view_model.dart';
import 'favorite_like_widget.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    final favouriteViewModel = context.watch<FavouriteViewModel>();
    final cartViewModel = context.read<CartCharacterViewModel>();
    return InkWell(
      onTap: () {
        context.router.navigate(CharacterCardRoute(character: character));
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(character.image),
              Text(
                character.name,
                maxLines: 1,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(character.status),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(character.gender),
                  StreamBuilder(
                  stream: cartViewModel.cartCharacters,
                  builder: (context, snapshot) {
                      return IconButton(
                        onPressed: () {
                        if (cartViewModel.isInCart(character)) {
                        final cartCharacter = cartViewModel
                            .getCartCharacterByCharacter(character);
                        final count = cartCharacter.count;
                        cartViewModel.changeCount(character, count + 1);
                           }
                        else {
                          cartViewModel.addToCart(character);
                        }
                        },

                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    )
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: FavoriteLike(favouriteViewModel: favouriteViewModel, character: character),
          ),
        ],
      ),
    );
  }
}

