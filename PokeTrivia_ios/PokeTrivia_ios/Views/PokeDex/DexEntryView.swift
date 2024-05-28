//
//  DexEntryView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import Foundation
import SwiftUI
import SafariServices

// Resource: https://designcode.io/swiftui-handbook-safari-inside-app

struct DexEntryView: View {
    var pokemon: Pokemon
    @State private var showSafari = false
    
    var body: some View {
        GeometryReader { g in
            ScrollView {
                ZStack {
                    Rectangle()
                        .fill(Color("PokeDexScreen"))
                        .frame(width: 250, height: 250)
                        .cornerRadius(10)
                    ImageView(image_link: pokemon.pic2, width: 230, height: 230, backgroud: Color.yellow)
                }
                VStack{
                    HStack {
                        Text("Type: ")
                            .font(Font.custom("Ubuntu Sans Mono", size: 20))
                            .fontWeight(.bold)
                        ForEach(pokemon.types, id: \.self) { type in
                            if let enum_type = Type_Gen.allCases.first(where: {$0.string_value == type}) {
                                enum_type.icon
                            } else {
                                Text("Error fetching type...")
                            }
                        }
                    }
                    Text("Generation: \(pokemon.gen)")
                        .font(Font.custom("Ubuntu Sans Mono", size: 20))
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    if pokemon.form != nil {
                        Text("Alt: \(pokemon.form!)")
                            .font(Font.custom("Ubuntu Sans Mono", size: 20))
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
                ZStack (alignment: .leading) {
                    Rectangle()
                        .fill(Color("PokeDexScreen"))
                        .cornerRadius(10)
                    StatBarView(pokemon: pokemon)
                }
                
                VStack {
                    Text("Click for more information...")
                        .font(Font.custom("Ubuntu Sans Mono", size: 17))
                        .foregroundStyle(.blue)
                        .padding()
                        .onTapGesture {
                            showSafari.toggle()
                        }
                        .fullScreenCover(isPresented: $showSafari) {
                            SFSafariViewWrapper(url: URL(string: "\(pokemon.dex_entry_url)")!)
                        }
                }.navigationTitle("\(pokemon.name)")
            }
            .frame(width: g.size.width)
            .background(Color("PokeDex"))
        }
    }
}

struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
            return SFSafariViewController(url: url)
        }

        func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
            return
        }
}

//#Preview {
//    DexEntryView(pokemon: )
//}
