//
//  HomeEntity.swift
//  PokedexVyper
//
//  Created by osx on 07/09/22.
//

import Foundation
//Sirve para crear la peticion y la url es la que consumimos
struct PokemonRequest : Request {
    var url: String
    func params() -> [(key: String, value: String)] {
        return []
    }
}
