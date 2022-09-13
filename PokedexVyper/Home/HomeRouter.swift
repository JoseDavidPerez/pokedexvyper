//
//  HomeRouter.swift
//  PokedexVyper
//
//  Created by osx on 05/09/22.
//

import Foundation
import UIKit

internal class HomeRouter {
    
    public var navegation : UINavigationController?
    
}

extension HomeRouter : HomeRouterProtocol {

    
    public static func createModule(navegation : UINavigationController) -> UIViewController {
        
        let viewController : HomeView = HomeView()
        
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.navegation = navegation
        
        return viewController
    }
}

