//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import Foundation
import SwiftUI

final class PokemonViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetail  : DetailPokemon?
    @Published var searchText = ""
    
    var filterPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter{
            
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init(){
        self.pokemonList = pokemonManager.getPokemon()
        
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of:pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetailsInfo(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetail = DetailPokemon(id: 0, height: 0, weight: 0)
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetail = data

            }
        }
        
    }
    
    func formatHeighWeight(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue/10)
        return string
    }
    
    
}
