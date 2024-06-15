//
//  ContentView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var databaseManager: PokemonDB
    
    var body: some View {
        MainMenuView()
        VStack {
            Text("Pokemon Database")
                .font(.largeTitle)
            Button(action: {
                fetchData()
            }) {
                Text("Fetch Data")
            }
        }
    }
    
    func fetchData() {
            guard let connection = databaseManager.connection else {
                print("No database connection available.")
                return
            }
            
            do {
                let query = "SELECT * FROM Pokemon;" // Adjust this to your actual query
                for row in try connection.prepare(query) {
                    print(row)
                }
            } catch {
                print("Failed to fetch data. Error: \(error)")
            }
        }
}

#Preview {
    ContentView()
}
