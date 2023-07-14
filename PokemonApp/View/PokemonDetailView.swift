//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    @EnvironmentObject var vm: PokemonViewModel
    let pokemon: Pokemon

    var body: some View {
        VStack {
            Spacer()
                .frame( height: 40 )
            
            KFImage(URL(string:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png"))
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 150)
                .padding([.leading,.trailing,.top],20)
                
            DescriptionView()

        }
        .environmentObject(vm)
        .onAppear {
            vm.getDetailsInfo(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonViewModel())    }
}

struct DescriptionView: View {
    @EnvironmentObject var vm: PokemonViewModel

    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(gradient:  Gradient(colors: [.neutralRadient1, .neutralRadient2]),
                           startPoint: .topLeading,
                           endPoint: .center)
            HStack (alignment: .top) {
                VStack (alignment: .leading,spacing: 8) {
                    Text("Size")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Height: \(vm.pokemonDetail?.weight ?? 0) cm")
                        .opacity(0.6)
                    Text("Weight: \(vm.pokemonDetail?.height ?? 0) kg")
                        .opacity(0.6)
                   
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
            
                
                
            }
            .padding(.all)
            
            
        }
//        .padding()
//        .padding(.top)
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: 0.0)
        .ignoresSafeArea()
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
