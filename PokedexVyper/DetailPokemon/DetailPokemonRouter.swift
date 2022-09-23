//
//  DetailPokemonRouter.swift
//  PokedexVyper
//
//  Created by Jose David Torres Perez on 20/09/22.
//

import Foundation
import UIKit

internal class DetailPokemonRouter {
    
    public var navigation : UINavigationController?
}


extension DetailPokemonRouter : DetailPokemonRouterProtocol {
    
    public static func createModule(navigation: UINavigationController?, pokemon: PokemonResponse) -> UIViewController {
        
        let viewController : DetailPokemonView = DetailPokemonView()
        viewController.pokemonData = pokemon
        if let nav = navigation {
            
        let presenter = DetailPokemonPresenter()
        let router = DetailPokemonRouter()
        let interactor = DetailPokemonInteractor()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        router.navigation = nav
        interactor.presenter = presenter
                
        return viewController
            
        }
        return UIViewController()
    }
}
