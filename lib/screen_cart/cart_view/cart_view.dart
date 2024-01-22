import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screen_cart/cart_widget/empty_cart_widget.dart';
import 'package:flutter_project/widget/common_widget/favorite_like_widget.dart';
import 'package:flutter_project/screen_cart/cart_widget/mini_cart_counter.dart';
import 'package:flutter_project/screen_cart/cart_widget/pay_bottom_button.dart';
import 'package:provider/provider.dart';

import '../../navigation/auto_route.dart';
import '../../screen_favorite/favorite_view_model/favourite_view_model.dart';
import '../cart_view_model/cart_view_model.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = context.read<CartCharacterViewModel>();
    final favouriteViewModel = context.read<FavouriteViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Корзина',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: cartViewModel.cartCharacters,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null || data.isEmpty) {
            return const EmptyCartWidget();
          }
          return Stack(
            children: <Widget>[
              ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final cartCharacter = data[index];
                  final character = cartCharacter.character;
                  final count = cartCharacter.count;
                  int sumPrice = 0;
                  for (final c in data) {
                    sumPrice = sumPrice + c.character.price;
                  }
                  return SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(cartCharacter.character.image),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(child: Text(character.name)),
                                  FavoriteLike(favouriteViewModel: favouriteViewModel, character: character),
                                  IconButton(
                                      onPressed: () {
                                        cartViewModel.removeFromCart(character);
                                      },
                                      icon: const Icon(Icons.close)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(character.status),
                                  MiniCartCounter(cartViewModel: cartViewModel, character: character, count: count)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
              const PayBottomButton(),
            ],
          );
        },
      ),
    );
  }
}
