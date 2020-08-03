import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/pages/home_page/widgets/app_bar_home.dart';
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
                    PokemonApi _pokemonApi = pokeApiStore.pokemonApi;
                    return (_pokemonApi != null)
                        ? ListView.builder(
                            itemCount: _pokemonApi.pokemon.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(_pokemonApi.pokemon[index].name));
                            },
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
