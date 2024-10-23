//
//  GridFunctions.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import Foundation
import SwiftUI

func parameterCheck(param1: Type_Gen, param2: Type_Gen, pokemon: Pokemon?) -> Bool {
    print("We are in paramCheck")
    
    if let p = pokemon{
        print("Pokemon: \(p.name)")
        print("types: \(p.types)")
        print("generation: \(p.gen)")
        
        // check if either param1 or param2 is an int
        // then check the appropriate values to see if they match
        if let check = Int(param1.string_value){
            print("-We are in param1 if")
            print("-Check: \(check)")
            if check == p.gen, p.types.contains(param2.string_value) {
                
                return true
            }
            
            if param2.string_value == "mono" && p.types.count == 1 {
                return true
            }
            
        } else if let check = Int(param2.string_value) {
            print("-We are in param2 if")
            print("-Check: \(check)")
            if check == p.gen, p.types.contains(param1.string_value) {
                
                return true
                
            }
            
            if param1.string_value == "mono" && p.types.count == 1 {
                return true
            }
            
        } else {
            
            print("-We are in else")
            if param1.string_value == "mono" {
                
                if p.types.contains(param2.string_value) {
                    
                    return true
                }
                
            } else if param2.string_value == "mono" {
                
                if p.types.contains(param1.string_value) {
                    return true
                }
            }
            
            if p.types.contains(param1.string_value), p.types.contains(param2.string_value){
                return true
            }

        }
    }
    
    return false
}

// get results depending on cell picked and its parameters
func getParamResult(cell_num: Int, param: [Type_Gen], pokemon: Pokemon) -> Color {
    
    switch cell_num {
    case 1:
        let color = parameterCheck(param1: param[0], param2: param[1], pokemon: pokemon) ? Color.green : Color.red
        return color
    case 2:
        let color = parameterCheck(param1: param[0], param2: param[2], pokemon: pokemon) ? Color.green : Color.red
        return color
    case 3:
        let color = parameterCheck(param1: param[3], param2: param[1], pokemon: pokemon) ? Color.green : Color.red
        return color
    case 4:
        let color = parameterCheck(param1: param[3], param2: param[2], pokemon: pokemon) ? Color.green : Color.red
        return color
    default:
        return Color.gray
    }
}

// TODO: integrate pokemon's origin generation later
func getResult(cell_num: Int, param: [Type_Gen], pokemon: [Pokemon]) -> Color {
    
    switch cell_num {
    case 1:
        let color = noneCheck(pokemon: pokemon, param1: param[0], param2: param[1]) ? Color.green : Color.red
        return color
    case 2:
        let color = noneCheck(pokemon: pokemon, param1: param[0], param2: param[2]) ? Color.green : Color.red
        return color
    case 3:
        let color = noneCheck(pokemon: pokemon, param1: param[3], param2: param[1]) ? Color.green : Color.red
        return color
    case 4:
        let color = noneCheck(pokemon: pokemon, param1: param[3], param2: param[2]) ? Color.green : Color.red
        return color
    default:
        return Color.gray
    }
    
}

// check if there are no pokemon that match the given parameters
func noneCheck(pokemon: [Pokemon], param1: Type_Gen, param2: Type_Gen) -> Bool {
    if param1.string_value == "mono" || param2.string_value == "mono" {
        return false
    }
    
    for p in pokemon {
        if let check = Int(param1.string_value) {
            if p.types.contains(param2.string_value) && p.gen == check {
                print("if")
                print("Parameters: \(param1.string_value), \(param2.string_value)")
                print(p.name)
                print(p.types)
                return false
            }
            
        } else if let check = Int(param2.string_value) {
            if p.types.contains(param1.string_value) && p.gen == check {
                print("else if")
                print("Parameters: \(param1.string_value), \(param2.string_value)")
                print(p.name)
                print(p.types)
                return false
            }
            
        } else {
        
            if p.types.contains(param1.string_value) && p.types.contains(param2.string_value) {
                print("else")
                print("Parameters: \(param1.string_value), \(param2.string_value)")
                print(p.name)
                print(p.types)
                return false
            }
            
        }
    }
    
    return true
    
}

// custom icons for types and generation
func typeIcon(type: String, color: Color) -> some View {
    ZStack {
        Rectangle()
            .fill(Color.black)
            // old width: 71
            .frame(width: 51, height: 28)
            .cornerRadius(10)
        Rectangle()
            .fill(Color.white)
            // old width: 69
            .frame(width: 49, height: 25)
            .cornerRadius(10)
        Rectangle()
            .fill(color)
            // old width: 66
            .frame(width: 46, height: 23)
            .cornerRadius(10)
        if let check = Int(type) {
            Text("GEN \(check)")
                .foregroundStyle(.white)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1)
                // old font size: 16
                .font(Font.custom("Ubuntu Sans Mono",size: 10))
                .fontWeight(.bold)
        } else {
            Text("\(type)")
                .foregroundStyle(.white)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1)
                // old width: 14
                .font(Font.custom("Ubuntu Sans Mono", size: 10))
                .fontWeight(.bold)
        }
        
    }
    
}
