//
//  PokeApi.swift
//  PokedexVyper
//
//  Created by osx on 06/09/22.
//

import Foundation


struct PokeApi {
    
    static var url = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    //Definimos en onSuccesed un callBack de tipo escaping que recibe un response arreglo
    //La funcion listPOKEMON define los parametros cuanto son y de que tipo
    func listPokemon(request: Request, onSuccesed: @escaping(_ response: [PokemonResponse])->Void, onError: @escaping(_ error: Error)->Void) {
    ApiTask().request(.get, request: request) { data, session in
        do {
            let responde = try JSONDecoder().decode([PokemonResponse].self, from: data)
            onSuccesed(responde)
        }catch {
            onError(ApiError.failedParse)
        }
    } onError: { error in
        onError(error)
    }

   }
    
}
