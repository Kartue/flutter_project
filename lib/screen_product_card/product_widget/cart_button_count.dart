import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widget/common_widget/to_cart_button.dart';
import '../../domain/model/character.dart';
import '../../screen_cart/cart_view_model/cart_view_model.dart';

class CartButtonCount extends StatelessWidget {
  const CartButtonCount({
    super.key,
    required this.cartViewModel,
    required this.character,
  });

  final CartCharacterViewModel cartViewModel;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: cartViewModel.cartCharacters,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const ToCartButton(
            );
          }
          if (cartViewModel.isInCart(character)) {
            final cartCharacter = cartViewModel.getCartCharacterByCharacter(character);
            final count = cartCharacter.count;
            return Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        cartViewModel.changeCount(character, count - 1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                      child: const Center(
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const Text(
                        'В КОРЗИНЕ',
                        style: TextStyle(
                            fontSize: 12, fontFamily: 'Montserrat', color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '$count',
                        style: const TextStyle(
                            fontSize: 12, fontFamily: 'Montserrat', color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        cartViewModel.changeCount(character, count + 1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                      child: const Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            );
          }
          return ToCartButton(
            onTap: () {
              cartViewModel.addToCart(character);
            },
          );
        });
  }
}
