//
//  PokemonCell.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import SwiftUI

struct PokemonCell: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Pokemon Name")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top,8)
                    .padding(.leading)
                
                HStack {
                    Text("Pokemon Type")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal,6)
                        .padding(.vertical,8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    Color.white
                                        .opacity(0.25))
                        )
                    
                    Image("pikachu")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom,8)
                        .frame(width: 80,height: 80)
                }
                .padding(.horizontal,8)

            }
        }
        .background(.yellow)
        .cornerRadius(10)


    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonCell()
        }
        .previewLayout(.fixed(width: 200, height: 200))
    }
}
