//
//  StatCheckPokemonView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/28/24.
//

import SwiftUI

struct StatCheckPokemonView: View {
    @Binding var pokemon: Pokemon?
    @Binding var isCorrect: Bool?
    @Binding var correct_cell: [(Int, Color)]
    var cell_num: Int
    
    var body: some View {
        ZStack {
            if let check = correct_cell.firstIndex(where: {$0.0 == cell_num}) {
                Rectangle()
                    .fill(correct_cell[check].1)
                    .frame(width: 160, height: 160)
                    .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color("GridCell"))
                    .frame(width: 160, height: 160)
                    .cornerRadius(8)
            }
            ImageView(image_link: pokemon!.pic2, width: 150, height: 150, backgroud: Color.white)
//            URLImage(URL(string: pokemon!.pic2)!){ image in
//                image
//                    .resizable()
////                        .aspectRatio(contentMode: .fit)
//                    .frame(width: 150, height: 150)
//                    .cornerRadius(8)
//            }
        }
    }
}

//#Preview {
//    StatCheckPokemonView()
//}
