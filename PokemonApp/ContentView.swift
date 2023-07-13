//
//  ContentView.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PokemonViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
