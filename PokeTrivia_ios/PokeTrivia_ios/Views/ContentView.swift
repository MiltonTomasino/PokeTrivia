//
//  ContentView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var PokemonDB: PokemonDatabase
    
    var body: some View {
        MainMenuView()
        }
    }

#Preview {
    ContentView()
}
