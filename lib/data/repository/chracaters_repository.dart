import 'package:breakingapi/data/models/character_model.dart';
import 'package:breakingapi/data/web_service/charactars_web_service.dart';

class CharactersRepository{
  final CharactersWebService charactersWebService;

  CharactersRepository(this.charactersWebService);
  Future<List<Result>> getAllCharacters() async {
    final characters = await charactersWebService.getAllCharacters();
    return characters.map((character) => Result.fromJson(character)).toList();
  }
}