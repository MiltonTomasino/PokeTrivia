//
//  RulesView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/28/24.
//

import SwiftUI

// Resource: https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-a-popover-view

// Display rules to user
struct RulesView: View {
    
    @State private var showingPopover = false
    
    var body: some View {
        Button("Rules") {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            ScrollView {
                VStack (alignment: .leading) {
                    Text("Rules")
                        .font(.headline)
                        .padding(.top, 10)
                    Text("Pick a Pokemon that matches their row + column parameters")
                    Text("Icons")
                        .font(.headline)
                        .padding()
                    ForEach(Type_Gen.allCases, id:\.self) { content in
                        
                        if let check = Int(content.string_value) {
                            HStack {
                                content.icon
                                Text(" = Comes from Generation \(check)")
                                    .padding(5)
                            }
                        } else {
                            HStack {
                                content.icon
                                Text(" = \(content.string_value)-type")
                                    .padding(5)
                            }
                        }
                    }
                }
            }.environment(\.font, Font.custom("Ubuntu Sans Mono", size: 17))
            Spacer()
        }
    }
}

#Preview {
    RulesView()
}
