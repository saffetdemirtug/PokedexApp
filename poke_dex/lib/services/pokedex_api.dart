import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:poke_dex/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/pokemongo-pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemonData() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<PokemonModel> _list = [];
    var results = await Dio().get(_url);
    var pokeList = jsonDecode(results.data)["pokemon"];

    if (pokeList is List) {
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return _list;
  }
}
