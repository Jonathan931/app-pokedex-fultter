import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokedex/pages/home_page/widgets/poke_item.dart';
import 'package:pokedex/stores/pokeapi_store.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokeApiStore pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.7),
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                ConstsApp.blackPokeball,
                height: 240,
                width: 240,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              AppBarHome(),
              Expanded(
                child: Container(
                  child: Observer(builder: (BuildContext context) {
                    PokemonApi _pokemonApi = pokeApiStore.pokeApi;
                    return (_pokemonApi != null)
                        ? AnimationLimiter(
                            child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.all(12),
                              addAutomaticKeepAlives: true,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: _pokemonApi.pokemon.length,
                              itemBuilder: (context, index) {
                                Pokemon pokemon = _pokemonApi.pokemon[index];
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  columnCount: 2,
                                  child: ScaleAnimation(
                                    child: GestureDetector(
                                      child: PokeItem(
                                        index: index,
                                        name: pokemon.name,
                                        image: pokeApiStore.getImage(
                                            numero: pokemon.num),
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
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
