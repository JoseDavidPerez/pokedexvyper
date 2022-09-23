//
//  PokemonResponse.swift
//  PokedexVyper
//
//  Created by osx on 06/09/22.
//

import Foundation
//Protocolo Codable
struct PokemonResponse : Codable {
    
    let attack : Int
    let defense : Int
    var description : String
    var type : String
    let name : String
    let imageURL : String
    
    //Recodar evitar errores CodingKey y no CodingKeys
    private enum CodingKeys : String, CodingKey {
        case attack = "attack"
        case defense = "defense"
        case description = "description"
        case type = "type"
        case name = "name"
        case imageURL = "imageUrl"
    }
}
