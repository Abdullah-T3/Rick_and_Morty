import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_morty/data/Models/characters.dart';
import 'package:rick_morty/data/repo/Characters_repo.dart';

part 'charcters_state.dart';

class CharctersCubit extends Cubit<CharctersState> {
  final CharactersRepo charactersRepo;
   
  List<Result> characters = [];
  CharctersCubit(this.charactersRepo) : super(CharctersInitial());

  List<Result>? getCharacters() {

    charactersRepo.getCharacters().then((characters) {
      emit(CharctersLoded(characters!));
      this.characters = characters ;
    });

return characters ;
  }
  
}
