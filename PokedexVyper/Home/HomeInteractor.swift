//
//  HomeInteractor.swift
//  PokedexVyper
//
//  Created by osx on 05/09/22.
//

import Foundation

internal class HomeInteractor {
    
    public var presenter : HomePresenterProtocol?
    
}


extension HomeInteractor : HomeInteractorProtocol {
    
    func apiPokemon(){
        
        //PokeApi().listPokemon(request: PokemonRequest(url: PokeApi.url)) { response in
        PokeApi().listPokemon(request: PokemonRequest(url: PokeApi.url)) { response in
            self.presenter?.succesedPokemon(data: response)
        } onError: { error in
            self.presenter?.errorPokemon(error: error)
        }
    }
    
}
