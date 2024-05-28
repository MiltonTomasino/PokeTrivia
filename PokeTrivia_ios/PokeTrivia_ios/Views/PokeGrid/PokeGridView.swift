//
//  PokeGridView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import SwiftUI

struct PokeGridView: View {
    
    @State var isSearching = false
    @State var searchText = ""
    @State var selected_cell: [(Int, Pokemon?)] = []
    @State var correct_cell: [(Int, Color)] = []
    @State var cell_num: Int?
    @State var pokemon_info: Pokemon?
    @State var current_cell: Int?
    @State var cell_count = 0
    @State var param_array = getRandomType_Gen()
    
    @State var color = Color.gray
    @State var isCorrect: Bool?
    
    // filter the list to what the user chooses
    var filterSearch: [Pokemon] {
        if searchText.isEmpty {
            return []
        } else {
            return pokemon.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack (alignment: .leading){
                    RulesView()
                        .padding(.leading, 200)
                    ZStack {
                        GeometryReader { g in
                            Rectangle()
                                .fill(Color("GridBackGround"))
                                .cornerRadius(10)
                                .frame(width: 318, height: 320)
                                .offset(x: 67, y: 33)
                        }
                        VStack {
                            // 2x2 Grid
                            HStack {
                                param_array[0].icon
                                VStack {
                                    param_array[1].icon.padding(.bottom, 3)
                                    GridCellView(isSearching: $isSearching,
                                                 pokemon_images: $pokemon_info,
                                                 selected_cell: $selected_cell,
                                                 cell_num: 1,
                                                 current_cell: $current_cell,
                                                 parameter1: $param_array[0],
                                                 parameter2: $param_array[1],
                                                 cell_color: $correct_cell,
                                                 isCorrect: $isCorrect)
                                }
                                VStack {
                                    param_array[2].icon.padding(.bottom, 3)
                                    GridCellView(isSearching: $isSearching,
                                                 pokemon_images: $pokemon_info,
                                                 selected_cell: $selected_cell,
                                                 cell_num: 2,
                                                 current_cell: $current_cell,
                                                 parameter1: $param_array[1],
                                                 parameter2: $param_array[2],
                                                 cell_color: $correct_cell,
                                                 isCorrect: $isCorrect)
                                }
                                
                            }
                            HStack {
                                param_array[3].icon
                                GridCellView(isSearching: $isSearching,
                                             pokemon_images: $pokemon_info,
                                             selected_cell: $selected_cell,
                                             cell_num: 3,
                                             current_cell: $current_cell,
                                             parameter1: $param_array[3],
                                             parameter2: $param_array[1],
                                             cell_color: $correct_cell,
                                             isCorrect: $isCorrect)
                                
                                GridCellView(isSearching: $isSearching,
                                             pokemon_images: $pokemon_info,
                                             selected_cell: $selected_cell,
                                             cell_num: 4,
                                             current_cell: $current_cell,
                                             parameter1: $param_array[3],
                                             parameter2: $param_array[2],
                                             cell_color: $correct_cell,
                                             isCorrect: $isCorrect)
                            }
                        }
                    }
                    .padding(.top, 0)
                    
                    // Resets the game so user can play again
                    Button {
                        resetPokeGrid()
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(Color("GridCell"))
                                .cornerRadius(10)
                                .frame(width: 60, height: 40)
                            Text("Reset")
                        }
                    }
                    .padding(.leading, 200)
                    .padding(.top, 10)
                    // prevents user from reseting when the grid has at least 1 cell filled
                    .disabled(cell_count > 0 && cell_count < 4 ? true : false)
                    
                    // display possible options whenever the user gets a grid cell incorrect
                    if cell_count == 4 {
                        VStack (alignment: .leading) {
                            HStack {
                                CorrectOptionsView(param1: $param_array[0], param2: $param_array[1], cell_num: 1, correct_cell: $correct_cell)
                                CorrectOptionsView(param1: $param_array[0], param2: $param_array[2], cell_num: 2, correct_cell: $correct_cell)
                            }.padding(.leading, 5)
                            HStack {
                                CorrectOptionsView(param1: $param_array[3], param2: $param_array[1], cell_num: 3, correct_cell: $correct_cell)
                                CorrectOptionsView(param1: $param_array[3], param2: $param_array[2], cell_num: 4, correct_cell: $correct_cell)
                                
                            }.padding(.leading, 5)
                        }
                    }
                }
                .onAppear {
                    param_array = getRandomType_Gen()
                    color = Color.gray
                }
                // overlay the search function over the view when cell is picked
                .overlay(
                    Group {
                        if isSearching {
                            VStack {
                                search_overlay
                                    .padding(.top, 250)
                                    .ignoresSafeArea(.keyboard)
                            }
                            
                        } else {
                            EmptyView()
                        }
                    }
                )
                
                
            }
            
        }.background(Color("PokeGrid"))
    }
    
    // reset game back to beginning
    func resetPokeGrid() {
        isSearching = false
        searchText = ""
        selected_cell = []
        correct_cell =  []
        pokemon_info = nil
        current_cell = nil
        cell_count = 0
        param_array = getRandomType_Gen()
        color = Color.gray
        isCorrect = false
    }
    
    var search_overlay: some View {
        ZStack {
            Rectangle()
                .fill(Color("PokeGrid"))
                .frame(width: 400, height: 715)
                .cornerRadius(8)
            VStack {
                SearchBar(text: $searchText, color: Color("GridCell"))
                HStack {
                    Button {
                        color = getResult(cell_num: current_cell!, param: param_array, pokemon: pokemon)
                        correct_cell.append((current_cell!, color))
                        selected_cell.append((current_cell!, nil))
                        cell_count += 1
                        isSearching.toggle()
                    } label: {
                        Text("None")
                            .font(Font.custom("Ubuntu Sans Mono", size: 17))
                            .padding()
                            .background(Color("GridCell"))
                            .cornerRadius(10)
                    }
                    Button {
                        isSearching.toggle()
                    } label: {
                        Text("Return")
                    }
                    .font(Font.custom("Ubuntu Sans Mono", size: 17))
                    .padding()
                    .background(Color("GridCell"))
                    .cornerRadius(10)
                }
                List(filterSearch, id: \.id) { pokemon in
                    Button {
                        pokemon_info = pokemon
                        color = getParamResult(cell_num: current_cell!, param: param_array, pokemon: pokemon)
                        selected_cell.append((current_cell!, pokemon))
                        correct_cell.append((current_cell!, color))
                        cell_count += 1
                        isSearching.toggle()
                    } label: {
                        HStack {
                            VStack (alignment: .leading){
                                Text(pokemon.name)
                                    .font(Font.custom("Ubuntu Sans Mono", size: 17))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                if pokemon.form != nil {
                                    Text(pokemon.form!)
                                        .font(Font.custom("Ubuntu Sans Mono", size: 15))
                                        .fontWeight(.light)
                                }
                            }
                            Spacer()
                            ImageView(image_link: pokemon.pic1, width: 70, height: 70, backgroud: Color.white)
//                            URLImage(URL(string: pokemon.pic1)!) { image in
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 70, height: 70)
//                                
//                            }
//                            .frame(width: 70, height: 70)
                        }
                    }
                    
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}

#Preview {
    PokeGridView()
}
