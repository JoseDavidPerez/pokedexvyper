//
//  PokeApi.swift
//  PokedexVyper
//
//  Created by osx on 06/09/22.
//

import Foundation

//
struct PokeApi {
    
    static var url = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    //Definimos en onSuccesed un callBack de tipo escaping que recibe un response arreglo
    //La funcion listPOKEMON define los parametros cuanto son y de que tipo
    
    func listPokemon(request: Request, onSuccesed: @escaping(_ response: [PokemonResponse])->Void, onError: @escaping(_ error: Error)->Void) {
    ApiTask().request(.get, request: request) { data, session in
        do {
            //PokemonResponse debe ser opcional ya que el json contiene null
            let responde = try JSONDecoder().decode([PokemonResponse?].self, from: data)
            //Quitamos los que son null en uno nuevo arreglo
            var pokemons : [PokemonResponse] = []
            for pokemon in responde{
                if let pokemon = pokemon {
                    pokemons.append(pokemon)
                }
            }
            onSuccesed(pokemons)
        }catch {
            onError(ApiError.failedParse)
        }
    } onError: { error in
        onError(error)
    }

   }
    
}
