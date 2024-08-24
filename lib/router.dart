import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/Constants/strings.dart';
import 'package:rick_morty/Logic/cubit/charcters_cubit.dart';
import 'package:rick_morty/data/Apis/characters_api.dart';
import 'package:rick_morty/data/repo/Characters_repo.dart';
import 'package:rick_morty/presntation/Screens/Charctar_Details_Screan.dart';
import 'package:rick_morty/presntation/Screens/home_Screan.dart';
import 'data/Models/characters.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    late CharctersCubit? charctersCubit;
    late CharactersRepo charactersRepo;
 
      charactersRepo = CharactersRepo(charactersApi: CharactersApi());
      charctersCubit = CharctersCubit(charactersRepo);
    

    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => charctersCubit!=null ? charctersCubit! : CharctersCubit(charactersRepo),
          child: HomeScrean(),
        ),
        
        );
      case CharctarDetailsPage:
        final args = settings.arguments as Result;
        return MaterialPageRoute(builder: (context) => CharctarDetailsScrean( result: args,));
    }
    return null;
  }
}
