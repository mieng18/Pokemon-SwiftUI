//
//  PokemonCell.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import SwiftUI

struct PokemonCell: View {
    @EnvironmentObject var vm: PokemonViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140

    
    var body: some View {
            VStack {
              
                    AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) {
                        image in
                        if let image = image {
                           image
                                .resizable()
                                .scaledToFit()
                                .frame(width: dimensions, height: dimensions)
                        }
                    } placeholder: {
                        ProgressView()
                            .frame(width: dimensions, height: dimensions)
                    }
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .fill(
//                                    Color.white
//                                        .opacity(0.25))
//                                .padding(.all,8)
//
//                        )
//
                Text(pokemon.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.leading)
       

            }
            .padding(.all,12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(gradient:  Gradient(colors: [.neutralRadient1, .neutralRadient2]),
                                       startPoint: .topLeading,
                                       endPoint: .center)
                    )
               
            )

    }
}

struct PokemonCell_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            PokemonCell(pokemon: Pokemon.samplePokemon)
        }
        .environmentObject(PokemonViewModel())
        .previewLayout(.fixed(width: (UIScreen.main.bounds.width - 20)/2,height: 200 ))
    }
}
