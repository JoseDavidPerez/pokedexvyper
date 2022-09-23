//
//  HomeProtocol.swift
//  PokedexVyper
//
//  Created by osx on 05/09/22.
//

import Foundation

protocol HomeViewProtocol {
    func error(text: String)
    func reloadData(data: [PokemonResponse])
}

protocol HomePresenterProtocol {
    func getPokemon()
    func succesedPokemon(data: [PokemonResponse])
    func errorPokemon(error: Error)
    func showDetailPokemon(data: PokemonResponse)
}

protocol HomeInteractorProtocol {
    func apiPokemon()
}

protocol HomeRouterProtocol {
    func respondeDetailPokemon(data: PokemonResponse)
}
