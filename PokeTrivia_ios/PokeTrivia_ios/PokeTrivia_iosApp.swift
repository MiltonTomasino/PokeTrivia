//
//  PokeTrivia_iosApp.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import SwiftUI

let pokemon: [Pokemon] = load("pokemon_data.json")

@main
struct PokeTrivia_iosApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
