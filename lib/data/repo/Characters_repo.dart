import 'package:rick_morty/data/Apis/characters_api.dart';
import 'package:rick_morty/data/Models/characters.dart';

class CharactersRepo {
  CharactersApi  charactersApi ;
  CharactersRepo({required this.charactersApi});

  Future<List<Result>?> getCharacters() async {
    final characters = await charactersApi.getCharacters();
    return characters == null ? null : characters;
  }
}