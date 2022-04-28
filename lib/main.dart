import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemon.repository.dart';
import 'package:pokedex/features/home/container/home_conteiner.dart';
import 'package:pokedex/features/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
