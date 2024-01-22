import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/navigation/auto_route.dart';
import 'package:flutter_project/screen_cart/cart_view_model/cart_view_model.dart';
import 'package:flutter_project/screen_favorite/favorite_view_model/favourite_view_model.dart';
import 'package:flutter_project/screen_product_card/product_widget/cart_button_count.dart';
import 'package:flutter_project/widget/common_widget/favorite_like_widget.dart';
import 'package:flutter_project/screen_product_card/product_widget/table_characteristic.dart';
import 'package:provider/provider.dart';
import '../../domain/model/character.dart';

@RoutePage()
class CharacterCardScreen extends StatelessWidget {
  const CharacterCardScreen({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final cartViewModel = context.read<CartCharacterViewModel>();
    final favouriteViewModel = context.watch<FavouriteViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
              context.router.navigate(const CatalogTab());
            },
              icon: const Icon(Icons.keyboard_arrow_left)),
            centerTitle: true,
            title: Text(character.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.w800,
              ),
            ),
        ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            Stack(
            children: [
                SizedBox(width: 400,
                    height: 380,
                    child: Image.network(character.image)),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: SizedBox(
                      width: 30,
                        height:30 ,
                        child: FavoriteLike(favouriteViewModel: favouriteViewModel, character: character)),
                  ),
              ],
        ),

            Text(character.name,
                style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontWeight: FontWeight.w400
            ),),

            CartButtonCount(cartViewModel: cartViewModel, character: character),
            TableCharacteristic(character: character),
        ],
        ),
      ),
    );
  }
}

