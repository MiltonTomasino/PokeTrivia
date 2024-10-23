//
//  ImageView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/28/24.
//

import SwiftUI

struct ImageView: View {
    var image_link: String
    var width: CGFloat
    var height: CGFloat
    var backgroud: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(backgroud)
                .frame(width: width + 6, height: height + 6)
                .cornerRadius(8)
            AsyncImage(url: URL(string: image_link)) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray
                        ProgressView()
                    }
                case .success(let image):
                    image.resizable()
                case .failure(let error):
                    Text("Error loading image: \(error)")
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    ImageView(image_link: "https://archives.bulbagarden.net/media/upload/f/fb/0001Bulbasaur.png", width: 150, height: 150, backgroud: Color.pink)
}
