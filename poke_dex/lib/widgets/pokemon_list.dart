import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/model/pokemon_model.dart';
import 'package:poke_dex/services/pokedex_api.dart';
import 'package:poke_dex/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
   // ignore: prefer_const_constructors_in_immutables
   PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonList;
  @override
  void initState() {
    _pokemonList = PokeApi.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ignore: no_leading_underscores_for_local_identifiers
          List<PokemonModel> _listem = snapshot.data!;

          return GridView.builder(itemCount: _listem.length,gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ScreenUtil().orientation== Orientation.portrait ? 2 : 3 )
            
            , itemBuilder: (context, index) => PokeListItem(pokemon: _listem[index]) ,);
        } else if (snapshot.hasError) {
          return const Text("başarısız");
        } else {
          return const Center(child: CircularProgressIndicator(color: Colors.pinkAccent,));
        }
      },
    );
  }
}

