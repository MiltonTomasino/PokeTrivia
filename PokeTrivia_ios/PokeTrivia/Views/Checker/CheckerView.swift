//
//  CheckerView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import SwiftUI

struct CheckerView: View {
    
    @State var random_pokemon1: Pokemon?
    @State var random_pokemon2: Pokemon?
    @State var isCorrect: Bool?
    @State var random_param = getRandomStat()
    @State var quickmode = false
    @State var correct_cell: [(Int, Color)] = []
    @State var isRefreshing = false
    
    
    var body: some View {
        Text("Who has the higher \(random_param.value) Stat?")
            .font(Font.custom("Ubuntu Sans Mono", size: 17))
            .fontWeight(.bold)
        HStack {
            Toggle("Quick mode", isOn: $quickmode)
                .font(Font.custom("Ubuntu Sans Mono", size: 14))
                .fontWeight(.light)
        }
        .frame(width: 150)
        .padding(.leading, 200)
        .padding(.bottom, 10)
        VStack {
            HStack {
                if random_pokemon1 != nil {
                    VStack {
                        Button {
                            isCorrect = statResult(stat: random_param, pokemon1: random_pokemon1, pokemon2: random_pokemon2, isEqual: false)
                            
                            if isCorrect! {
                                correct_cell.append((1, Color.green))
                            } else {
                                correct_cell.append((1, Color.red))
                            }
                            
                            if quickmode {
                                isRefreshing = true
                                // delay refresh so user can see if they were correct
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    restartGame()
                                    isRefreshing = false
                                }
                                
                                
                            }
                        } label: {
                            StatCheckPokemonView(pokemon: $random_pokemon1, isCorrect: $isCorrect, correct_cell: $correct_cell, cell_num: 1)
                        }
                        Text("\(random_pokemon1!.name)")
                            .font(Font.custom("Ubuntu Sans Mono", size: 17))
                    }
                    
                }
                
                if random_pokemon2 != nil {
                    VStack {
                        Button {
                            isCorrect = statResult(stat: random_param, pokemon1: random_pokemon2, pokemon2: random_pokemon1, isEqual: false)
                            
                            if isCorrect! {
                                correct_cell.append((2, Color.green))
                            } else {
                                correct_cell.append((2, Color.red))
                            }
                            
                            if quickmode {
                                isRefreshing = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    restartGame()
                                    isRefreshing = false
                                }
                                
                                
                            }
                        } label: {
                            StatCheckPokemonView(pokemon: $random_pokemon2, isCorrect: $isCorrect, correct_cell: $correct_cell, cell_num: 2)
                        }
                        Text("\(random_pokemon2!.name)")
                            .font(Font.custom("Ubuntu Sans Mono", size: 17))
                    }

                }
                
            }.onAppear {
                if random_pokemon1 == nil {
                    random_pokemon1 = pokemon.randomElement()!
                }
                
                if random_pokemon2 == nil {
                    random_pokemon2 = pokemon.randomElement()!
                }
                
                random_param = getRandomStat()
                
            }
            
            Button {
                isCorrect = statResult(stat: random_param, pokemon1: random_pokemon1, pokemon2: random_pokemon2, isEqual: true)
                
                if isCorrect! {
                    correct_cell.append((1, Color.green))
                    correct_cell.append((2, Color.green))
                } else {
                    correct_cell.append((1, Color.red))
                    correct_cell.append((2, Color.red))
                }
                
                if quickmode {
                    isRefreshing = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        restartGame()
                        isRefreshing = false
                    }
                    
                    
                }

            } label: {
                Text("=")
                    .font(Font.custom("Ubuntu Sans Mono", size: 30))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color("GridCell"))
            }.cornerRadius(8)
            
        }
        if !quickmode {
            Button {
                restartGame()
            } label: {
                Text("Try again")
                    .font(Font.custom("Ubuntu Sans Mono", size: 18))
                    .padding()
                    .background(Color("GridCell"))
            }
            .padding(.top, 10)
            .cornerRadius(8)
        } else {
            EmptyView()
        }
    }
    
    // refresh the game when clicked
    // if quick mode is on, no need for button
    func restartGame() {
        random_pokemon1 = pokemon.randomElement()!
        random_pokemon2 = pokemon.randomElement()!
        correct_cell = []
        if !quickmode {isCorrect = false}
        random_param = getRandomStat()
    }
}

#Preview {
    CheckerView()
}
