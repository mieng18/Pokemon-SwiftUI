//
//  View+Extension.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
