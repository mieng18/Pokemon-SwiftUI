//
//  Color+Extension.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import Foundation

import SwiftUI

extension Color {

    init(_ hex: UInt, alpha: Double = 1) {
    self.init(
        .sRGB,
        red: Double((hex >> 16) & 0xFF) / 255,
        green: Double((hex >> 8) & 0xFF) / 255,
        blue: Double(hex & 0xFF) / 255,
        opacity: alpha
    )
    }
}


extension Color {
   
    
    static let neutralRadient1 = Color(0xF6F3E7)
    static let neutralRadient2 = Color(0xE3D7BD)




}

