//
//  PokeDexView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import SwiftUI

struct PokeDexView: View {
//    @EnvironmentObject var PokemonDB: PokemonDatabase
    
    var filterSearch: [Pokemon] {
        if text.isEmpty {
            if pickedGen > 0 {
                return pokemon.filter {$0.gen == pickedGen}
            } else {
                return pokemon
            }
        } else {
            return pokemon.filter {
                let nameMatches = $0.name.lowercased().contains(text.lowercased())
                let formMatches = $0.form?.lowercased().contains(text.lowercased()) ?? false
                let genMatches = pickedGen == 0 || $0.gen == pickedGen
                return (nameMatches || formMatches) && genMatches
            }
        }
    }
    
    @State var text = ""
    @State var filteredGen = false
    @State var pickedGen = 0
    @State var isChecked = false
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .frame(width: 300)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.custom("Ubuntu Sans Mono", size: 17))
        }
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color("PokeDexScreen"))
                    .frame(width: 200, height: 50)
                    .cornerRadius(10)
                HStack {
                    Picker("Generation", selection: $pickedGen) {
                        ForEach(0..<10) { gen in
                            if gen == 0 {Text("Generation: ").tag(gen)}
                            else {
                                Text("Generation: \(gen)").tag(gen)
                            }
                        }
                    }.accentColor(.red)
                }
            }
        }
        List(filterSearch, id: \.id) { p in
            NavigationLink(destination: DexEntryView(pokemon: p)) {
                HStack {
                    VStack (alignment: .leading){
                        Text(p.name)
                            .font(Font.custom("Ubuntu Sans Mono", size: 17))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        if p.form != nil {
                            Text(p.form!)
                                .font(Font.custom("Ubuntu Sans Mono", size: 15))
                                .fontWeight(.light)
                        }
                    }
                    Spacer()
                    ImageView(image_link: p.pic1, width: 70, height: 70, backgroud: Color.white)
                        .frame(height: 70)
                }
            }
        }
        .navigationTitle("PokeDex")
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    PokeDexView()
}
