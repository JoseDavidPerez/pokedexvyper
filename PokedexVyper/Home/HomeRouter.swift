//
//  HomeRouter.swift
//  PokedexVyper
//
//  Created by osx on 05/09/22.
//

import Foundation
import UIKit

internal class HomeRouter {
    
    static var navigation : UINavigationController?
    
}

extension HomeRouter : HomeRouterProtocol {

    func respondeDetailPokemon(data: PokemonResponse){
        
        let detailpokemon = DetailPokemonRouter.createModule(navigation: HomeRouter.navigation, pokemon: data)
        Self.navigation?.pushViewController(detailpokemon, animated: true)
    }
    
    public static func createModule(navigation : UINavigationController) -> UIViewController {
        
        let viewController : HomeView = HomeView()
        
        self.navigation = navigation
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        

        
        return viewController
            
    }
}

