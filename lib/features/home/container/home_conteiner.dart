import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemons.dart';
import 'package:pokedex/common/repositories/pokemon.repository.dart';
import 'package:pokedex/features/home/pages/home_error.dart';
import 'package:pokedex/features/home/pages/home_loading.dart';
import 'package:pokedex/features/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({ Key? key, required this.repository }) : super(key: key);
  final IPokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>> (
    future: repository.getAllPokemons(),
    builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return HomeLoading();
      }
      if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
        return HomePage(list: snapshot.data!);
      }
      if(snapshot.hasError){
        return HomeError(error: (snapshot.error as Failure).message!);
      }

      return Container();
    });
  }
}