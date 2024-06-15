//
//  MainMenuView.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Text("PokeTrivia")
                        .frame(width: 400)
                        .font(Font.custom("Ubuntu Sans Mono", size: 50))
                        .fontWeight(.bold)
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 0, leading: 70, bottom: 0, trailing: 40))
                        .listRowBackground(Color("PokeGrid"))
                        .padding(.top, 150)
                        .padding(.bottom, 100)
                    Section {
                        NavigationLink(destination: PokeGridView()) {
                            Text("PokeGrid Game")
                                .font(Font.custom("Ubuntu Sans Mono", size: 20))
                        }
                        NavigationLink(destination: CheckerView()) {
                            Text("Stat Check Game")
                                .font(Font.custom("Ubuntu Sans Mono", size: 20))
                        }
                        
                        NavigationLink(destination: PokeDexView()) {
                            Text("PokeDex")
                                .font(Font.custom("Ubuntu Sans Mono", size: 20))
                            
                        }
                        
                        NavigationLink(destination: TestingView()) {
                            Text("Testng View")
                                .font(Font.custom("Ubuntu Sans Mono", size: 20))
                            
                        }
                    } header: {
                        Text("Main Menu")
                            .font(Font.custom("Ubuntu Sans Mono", size: 18))
                            .fontWeight(.bold)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 70, bottom: 0, trailing: 60))
                    .listRowBackground(
                        Capsule()
                            .fill(Color("PokeGrid"))
                            .padding(.horizontal, 50)
                            .padding(.vertical, 5)
                    )
                    
                }
                .cornerRadius(10)
                .background(Color("PokeGrid"))
                .scrollContentBackground(.hidden)
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Main Menu", displayMode: .inline)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

#Preview {
    MainMenuView()
}
