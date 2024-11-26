
import 'package:breakingapi/data/models/character_model.dart';
import 'package:breakingapi/data/repository/chracaters_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  final CharactersRepository charactersRepository;
  late List<Result> characters;

  Future<List<Result>> getAllCharacters() async {
    try {
      final fetchedCharacters = await charactersRepository.getAllCharacters();
      characters = fetchedCharacters.cast<Result>();
      emit(CharactersLoaded(characters));
      return characters;
    } catch (error) {
      print('Error fetching characters: $error');
      return [];
    }
  }
}
