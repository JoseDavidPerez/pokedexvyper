//
//  HomePresenter.swift
//  PokedexVyper
//
//  Created by osx on 05/09/22.
//

import Foundation

internal class HomePresenter {
    
    public var view: HomeViewProtocol?
    public var interactor: HomeInteractorProtocol?
    public var router : HomeRouterProtocol?
}

extension HomePresenter : HomePresenterProtocol {
    
    func succesedPokemon(data: [PokemonResponse]) {
        view?.reloadData(data: data)
    }
    
    
    func errorPokemon(error: Error) {
        view?.error(text: error.localizedDescription)
    }
    
    func getPokemon(){
        interactor?.apiPokemon()
    }
    
}
