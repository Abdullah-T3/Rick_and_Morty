import '../Apis/characters_api.dart';
import '../Models/characters.dart';

class CharactersRepo {
  CharactersApi  charactersApi ;
  CharactersRepo({required this.charactersApi});

  Future<List<Result>?> getCharacters() async {
    final characters = await charactersApi.getCharacters();
    return characters == null ? null : characters;
  }
}