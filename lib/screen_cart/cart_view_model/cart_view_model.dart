import 'package:rxdart/rxdart.dart';

import '../../domain/model/cart_character.dart';
import '../../domain/model/character.dart';

class CartCharacterViewModel {
  final BehaviorSubject<List<CartCharacter>> cartCharacters =
      BehaviorSubject.seeded([]);

  void addToCart(Character character) {
    cartCharacters.value = [
      ...cartCharacters.value,
      CartCharacter(character: character, count: 1)
    ];
  }

  void removeFromCart(Character character) {
    final data = cartCharacters.value;
    data.removeWhere((element) => element.character.id == character.id);
    cartCharacters.value = data;
  }

  void changeCount(Character character, int count) {
    if (count == 0){
      removeFromCart(character);
      return;
    }
    final data = cartCharacters.value;
    final index =
        data.indexWhere((element) => element.character.id == character.id);
    data.removeAt(index);
    data.insert(index, CartCharacter(character: character, count: count));
    cartCharacters.value = data;
  }

  bool isInCart(Character character) {
    return cartCharacters.value
            .indexWhere((element) => element.character.id == character.id) !=
        -1;
  }

  CartCharacter getCartCharacterByCharacter(Character character) {
    return cartCharacters.value
        .firstWhere((element) => element.character.id == character.id);
  }
}
