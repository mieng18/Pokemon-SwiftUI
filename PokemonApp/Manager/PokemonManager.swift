//
//  PokemonManager.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//
import Foundation

class PokemonManager {
    
    var pokemon: [Pokemon] = []
    
    func getPokemon() -> [Pokemon] {
        let data: Pokemonpage = Bundle.main.decode(fileName: "pokemon.json")
        
        self.pokemon = data.results
        
        return pokemon
        
    }
    
    func getDetailedPokemon(id: Int, completion: @escaping (DetailPokemon) -> ()) {
        
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }

        
    }
    
    
}
