//
//  TestingView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 6/14/24.
//

import SwiftUI

struct TestingView: View {
    @EnvironmentObject var dataManager: PokemonDatabase
    @State var array: [Pokemon] = []
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            List(array, id: \.id){ i in
                Text("\(i.dex_num). \(i.name)")
                if (i.form != nil) {
                    Text("\(i.form!)")
                }
            }
        }.onAppear{
            array = dataManager.fetchPokemon(query: "SELECT * FROM Pokemon;")
        }
    }
}

#Preview {
    TestingView()
}
