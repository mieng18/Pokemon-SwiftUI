//
//  PokemonView.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import SwiftUI

struct PokemonView: View {
    @StateObject var viewModel = PokemonViewModel()

 
    private let columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns,spacing: 20){
                    ForEach(viewModel.filterPokemon){ pokemon in

                        PokemonCell(pokemon: pokemon)
                        
                    }
                }
                .frame(maxWidth: .infinity)
            }.navigationTitle("Pokemon")
        }
        .environmentObject(viewModel)

    }
}
struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
