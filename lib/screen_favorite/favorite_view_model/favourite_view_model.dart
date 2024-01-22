import 'package:rxdart/rxdart.dart';
import '../../domain/model/character.dart';

class FavouriteViewModel {
  final BehaviorSubject<List<Character>> favourites =
      BehaviorSubject.seeded([]);

  void addToFavourite(Character character) {
    favourites.value = [...favourites.value, character];
  }

  void removeToFavourite(Character character) {
    final data = favourites.value;
    data.remove(character);
    favourites.value = data;
  }
}
