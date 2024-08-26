import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Constants/strings.dart';
import 'Logic/cubit/charcters_cubit.dart';
import 'data/Apis/characters_api.dart';
import 'data/repo/Characters_repo.dart';
import 'presntation/Screens/Charctar_Details_Screan.dart';
import 'presntation/Screens/home_Screan.dart';
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
