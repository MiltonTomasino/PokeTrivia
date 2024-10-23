//
//  StatBarView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import SwiftUI
import Charts

// Resource: https://www.devtechie.com/community/public/posts/154033-new-in-swiftui-4-charts-bar-chart

// bar chart to display a stats given a pokemon
struct StatBarView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            Text("Stats")
                .font(Font.custom("Ubuntu Sans mono", size: 30))
                .fontWeight(.bold)
            Chart {
                BarMark(
                    x: .value("Min", pokemon.hp),
                    y: .value("Stat", "HP")
                )
                .foregroundStyle(Color(red: 112/255, green: 219/255, blue: 112/255))
                .annotation(position: .trailing) {
                    Text("\(pokemon.hp)")
                        .font(Font.custom("Ubuntu Sans Mono", size: 15))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                BarMark(
                    x: .value("Min", pokemon.attack),
                    y: .value("Stat", "Attack")
                )
                .foregroundStyle(.red)
                .annotation(position: .trailing) {
                    Text("\(pokemon.attack)")
                        .font(Font.custom("Ubuntu Sans Mono", size: 15))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                BarMark(
                    x: .value("Min", pokemon.defense),
                    y: .value("Stat", "Defense")
                )
                .foregroundStyle(Color(red: 1, green: 102/255, blue: 0))
                .annotation(position: .trailing) {
                    Text("\(pokemon.defense)")
                        .font(Font.custom("Ubuntu Sans Mono", size: 15))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                BarMark(
                    x: .value("Min", pokemon.sp_attack),
                    y: .value("Stat", "Special Attack")
                )
                .foregroundStyle(Color(red: 128/255, green: 191/255, blue: 1))
                .annotation(position: .trailing) {
                    Text("\(pokemon.sp_attack)")
                        .font(Font.custom("Ubuntu Sans Mono", size: 15))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                BarMark(
                    x: .value("Min", pokemon.sp_defense),
                    y: .value("Stat", "Special Defense")
                )
                .foregroundStyle(Color(red: 101/255, green: 102/255, blue: 1))
                .annotation(position: .trailing) {
                    Text("\(pokemon.sp_defense)")
                        .font(Font.custom("Ubuntu Sans Mono", size: 15))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                BarMark(
                    x: .value("Min", pokemon.speed),
                    y: .value("Stat", "Speed")
                )
                .foregroundStyle(Color(red: 204/255, green: 0, blue: 1))
                .annotation(position: .trailing) {
                    Text("\(pokemon.speed)")
                        .font(Font.custom("Ubuntu Sans Mono", size: 15))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
            }
            .frame(width: 375, height: 300)
            .chartXScale(domain: 0...300)
            .chartXAxis {
                AxisMarks(values: [0, 50, 100, 150, 200, 250])
            }
            


        }
    }
}

//#Preview {
//    let list: [Pokemon] = load("pokemon_data.json")
//    
//    StatBarView(pokemon: list.randomElement())
//}
