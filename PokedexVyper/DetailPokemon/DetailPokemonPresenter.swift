//
//  DetailPokemonPresenter.swift
//  PokedexVyper
//
//  Created by Jose David Torres Perez on 20/09/22.
//

import Foundation

internal class DetailPokemonPresenter {
    
    public var view: DetailPokemonViewProtocol?
    public var interactor: DetailPokemonInteractorProtocol?
    public var router : DetailPokemonRouterProtocol?
    
}



extension DetailPokemonPresenter: DetailPokemonPresenterProtocol {
    
}
