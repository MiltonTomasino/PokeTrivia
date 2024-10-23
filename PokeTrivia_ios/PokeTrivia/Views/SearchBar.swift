//
//  SearchBar.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/28/24.
//

import SwiftUI

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var color: Color
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .frame(width: 300)
                .border(color, width: 3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.custom("Ubuntu Sans Mono", size: 17))
        }
        .padding(.vertical)
    }
}

//#Preview {
//    SearchBar()
//}
