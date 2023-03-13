import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex/constants/ui_hepler.dart';
import 'package:poke_dex/model/pokemon_model.dart';

class PokeImageAndPokeBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndPokeBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    String _pokeballPath = "images/pokeball.png";
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            _pokeballPath,
            width: UIHelper.calculatePokeImageAndPokeball(),
            height: UIHelper.calculatePokeImageAndPokeball(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? " ",
              width: UIHelper.calculatePokeImageAndPokeball(),
              height: UIHelper.calculatePokeImageAndPokeball(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.pink,
              ),
            ),
          ),
        )
      ],
    );
  }
}
