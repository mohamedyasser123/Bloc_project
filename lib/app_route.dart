import 'package:breakingapi/business_layer/cubit/characters_cubit.dart';
import 'package:breakingapi/constans/strings.dart';
import 'package:breakingapi/data/repository/chracaters_repository.dart';
import 'package:breakingapi/data/web_service/charactars_web_service.dart';
import 'package:breakingapi/presentation/screens/charachers_details_screen.dart';
import 'package:breakingapi/presentation/screens/characters_screens.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRoute() {
    charactersRepository = CharactersRepository(CharactersWebService());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharacterScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const CharacterDetailsScreen(),
        );
      default:
        return null;
    }
  }
}