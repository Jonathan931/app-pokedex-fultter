import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/models/pokeapi.dart';

class ListPoke extends StatelessWidget {
  final PokemonApi pokemonApi;

  const ListPoke({Key key, this.pokemonApi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12),
        addAutomaticKeepAlives: true,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: pokemonApi.pokemon.length,
        itemBuilder: (context, index) {
          Pokemon pokemon = pokemonApi.pokemon[index];
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 375),
            columnCount: 2,
            child: ScaleAnimation(
              child: GestureDetector(
                child: Container(
                  color: Colors.red,
                ),
                // child: PokeItem(
                //   types: pokemon.type,
                //   index: index,
                //   name: pokemon.name,
                //   num: pokemon.num,
                // ),
                onTap: () {
                  // _pokemonStore.setPokemonAtual(
                  //     index: index);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder:
                  //         (BuildContext context) =>
                  //             PokeDetailPage(
                  //       index: index,
                  //     ),
                  //     fullscreenDialog: true,
                  //   ),
                  // );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
