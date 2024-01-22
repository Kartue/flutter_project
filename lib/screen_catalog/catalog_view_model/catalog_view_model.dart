import 'package:rxdart/rxdart.dart';

import '../../domain/data/character_repository.dart';
import '../../domain/model/character.dart';

class CatalogViewModel {
  final BehaviorSubject<List<Character>> characters = BehaviorSubject.seeded([]);

  void getCatalog() async {
    final response = await CharacterRepository.getCharactersByPage(page: 5);
    characters.value = response.result;
  }

}
