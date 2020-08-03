import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:http/http.dart' as http;
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokemonApi _pokemonApi;

  PokemonApi get pokeApi => _pokemonApi;

  @action
  fetchPokemonList() {
    _pokemonApi = null;
    loadPokeAPI().then((pokeList) => {_pokemonApi = pokeList});
  }

  @action
  getPokemon(int index) {
    return _pokemonApi.pokemon[index];
  }

  @action
  Widget getImage({String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:
          '${ConstsAPI.baseURL}/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  Future<PokemonApi> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsAPI.pokeapiURL);
      var decodeJson = jsonDecode(response.body);
      return PokemonApi.fromJson(decodeJson);
    } catch (error) {
      print("Erro ao carregar a lista");
      return null;
    }
  }
}
