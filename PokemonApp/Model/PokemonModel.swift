//
//  PokemonModel.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import Foundation


struct Pokemonpage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon] 
}

struct Pokemon: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
    
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
