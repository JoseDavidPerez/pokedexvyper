//
//  PokemonResponse.swift
//  PokedexVyper
//
//  Created by osx on 06/09/22.
//

import Foundation
//Protocolo Codable
struct PokemonResponse : Codable {
    
    let attack : Int?
    let defense : Int?
    let description : String?
    let type : String?
    let name : String?
    
    //Recodar evitar errores CodingKey y no CodingKeys
    private enum CodingKeys : String, CodingKey {
        case attack = "attack"
        case defense = "defense"
        case description = "description"
        case type = "type"
        case name = "name"
    }
}
