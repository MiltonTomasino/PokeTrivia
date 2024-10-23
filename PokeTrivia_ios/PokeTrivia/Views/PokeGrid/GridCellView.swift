//
//  GridCellView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/28/24.
//

import SwiftUI

struct GridCellView: View {
    
    @Binding var isSearching: Bool
    @Binding var pokemon_images: Pokemon?
    @Binding var selected_cell: [(Int, Pokemon?)]
    var cell_num: Int
    @Binding var current_cell: Int?
    @Binding var parameter1: Type_Gen
    @Binding var parameter2: Type_Gen
    @Binding var cell_color: [(Int, Color)]
    @Binding var isCorrect: Bool?
    
    var body: some View {
        
        Button(action: {
            isSearching.toggle()
            current_cell = cell_num
        }) {
            ZStack {
                // check and see if cell is correct or not
                // green = correct, red = incorrect, default = default color
                if let check = cell_color.firstIndex(where: {$0.0 == cell_num}) {
                    Rectangle()
                        .fill(cell_color[check].1)
                        .frame(width: 150, height: 150)
                        .cornerRadius(8)
                } else {
                    Rectangle()
                        .fill(Color("GridCell"))
                        .frame(width: 150, height: 150)
                        .cornerRadius(8)
                }
                if let index = selected_cell.firstIndex(where: {$0.0 == cell_num}) {
                    // display image in cell
                    if selected_cell[index].1 != nil {
                        ImageView(image_link: selected_cell[index].1!.pic2, width: 140, height: 140, backgroud: Color.white)
//                        URLImage(URL(string: selected_cell[index].1!.pic2)!){ image in
//                            image
//                                .resizable()
////                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 145, height: 145)
//                                .cornerRadius(8)
//                        }
                    } else {
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 145, height: 145)
                                .cornerRadius(8)
                            Text("None")
                                .font(Font.custom("Ubuntu Sans Mono", size: 30))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
        
    }
}

//#Preview {
//    GridCellView()
//}
