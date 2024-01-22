import 'package:dio/dio.dart';
import '../model/pagination_character.dart';

final dio = Dio();

class CharacterRepository {
  static Future<PaginationCharacter> getCharactersByPage({int page = 1}) async {
    final response = await dio.get('https://rickandmortyapi.com/api/character/?page=$page');
    return PaginationCharacter.fromJson(response.data);
  }
}
