import 'dart:convert';

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
