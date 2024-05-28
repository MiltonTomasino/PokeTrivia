//
//  CorrectOptionsView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/28/24.
//

import SwiftUI

struct CorrectOptionsView: View {
    @Binding var param1: Type_Gen
    @Binding var param2: Type_Gen
    var cell_num: Int
    @Binding var correct_cell: [(Int, Color)]
    
    var filteredSearch: [Pokemon] {
        return pokemon.filter { p in
            
            if let check = Int(param1.string_value) {
                if param2.string_value == "mono", p.types.count == 1 {
                    return true
                }
                
                if p.types.contains(param2.string_value), p.gen == check {
                    return true
                }
                
            } else if let check = Int(param2.string_value) {
                if param1.string_value == "mono", p.types.count == 1 {
                    return true
                }
                
                if p.types.contains(param1.string_value), p.gen == check {
                    return true
                }
                
                
            } else {
                
                if param1.string_value == "mono", p.types.count == 1, p.types.contains(param2.string_value) {
                    return true
                } else if param2.string_value == "mono", p.types.count == 1, p.types.contains(param1.string_value) {
                    return true
                }
                
                if p.types.contains(param1.string_value), p.types.contains(param2.string_value) {
                    return true
                }
            }
            
            return false
        }
    }
    
    var body: some View {
        if let index = correct_cell.firstIndex(where: {$0.0 == cell_num}), correct_cell[index].1 == Color.red {
            ZStack {
                Rectangle()
                    .fill(Color("GridBackGround"))
                    .frame(width: 188, height: 200)
                    .cornerRadius(8)
                VStack {
                    HStack{
                        Text("Options")
                            .font(Font.custom("Ubuntu Sans Mono", size: 15))
                            .fontWeight(.bold)
                        param1.icon
                        param2.icon
                    }.frame(width: 188, height: 50)
                    ScrollView {
                        ForEach(filteredSearch, id: \.id){ pokemon in
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
                                ImageView(image_link: pokemon.pic1, width: 50, height: 50, backgroud: Color.white)
//                                URLImage(URL(string: pokemon.pic1)!) { image in
//                                    image
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 70, height: 70)
//                                    
//                                }
//                                .frame(width: 50, height: 50)
                            }
                            Divider()
                                .padding(.vertical, 2)
                        }
                    }.frame(width: 188, height: 140)
                }
            }
            
        } else {
            
            EmptyView()
        }
    }
}

//#Preview {
//    CorrectOptionsView()
//}
