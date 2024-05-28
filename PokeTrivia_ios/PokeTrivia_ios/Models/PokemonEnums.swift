//
//  PokemonEnums.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import Foundation
import SwiftUI

enum Type_Gen: CaseIterable {
    case water
    case fire
    case grass
    case bug
    case poison
    case normal
    case electric
    case ice
    case fighting
    case ground
    case flying
    case psychic
    case ghost
    case dark
    case steel
    case fairy
    case dragon
    case rock
    case mono_type
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var string_value: String {
        switch self {
        case .water: return "Water"
        case .fire: return "Fire"
        case .grass: return "Grass"
        case .bug: return "Bug"
        case .poison: return "Poison"
        case .normal: return "Normal"
        case .electric: return "Electric"
        case .ice: return "Ice"
        case .fighting: return "Fighting"
        case .ground: return "Ground"
        case .flying: return "Flying"
        case .psychic: return "Psychic"
        case .ghost: return "Ghost"
        case .dark: return "Dark"
        case .steel: return "Steel"
        case .fairy: return "Fairy"
        case .dragon: return "Dragon"
        case .rock: return "Rock"
        case .mono_type: return "mono"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        }
    }
    
    var icon: some View {
        switch self {
        case .water: return typeIcon(type: "WATER", color: Color(red: 26/255, green: 117/255, blue: 1))
        case .fire: return typeIcon(type: "FIRE", color: Color(red: 1, green: 51/255, blue: 51/255))
        case .grass: return typeIcon(type: "GRASS", color: Color(red: 0, green: 204/255, blue: 102/255))
        case .bug: return typeIcon(type: "BUG", color: Color(red: 187/255, green: 1, blue: 51/255))
        case .poison: return typeIcon(type: "POISON", color: Color(red: 134/255, green: 0, blue: 179/255))
        case .normal: return typeIcon(type: "NORMAL", color: Color(red: 217/255, green: 217/255, blue: 217/255))
        case .electric: return typeIcon(type: "ELECTRIC", color: Color(red: 1, green: 1, blue: 77/255))
        case .ice: return typeIcon(type: "ICE", color: Color(red: 128/255, green: 223/255, blue: 1))
        case .fighting: return typeIcon(type: "FIGHTING", color: Color(red: 128/255, green: 32/255, blue: 0))
        case .ground: return typeIcon(type: "GROUND", color: Color(red: 1, green: 198/255, blue: 26/255))
        case .flying: return typeIcon(type: "FLYING", color: Color(red: 179/255, green: 217/255, blue: 1))
        case .psychic: return typeIcon(type: "PSYCHIC", color: Color(red: 1, green: 77/255, blue: 196/255))
        case .ghost: return typeIcon(type: "GHOST", color: Color(red: 71/255, green: 71/255, blue: 209/255))
        case .dark: return typeIcon(type: "DARK", color: Color(red: 26/255, green: 13/255, blue: 0))
        case .steel: return typeIcon(type: "STEEL", color: Color(red: 153/255, green: 153/255, blue: 153/255))
        case .fairy: return typeIcon(type: "FAIRY", color: Color(red: 1, green: 204/255, blue: 1))
        case .dragon: return typeIcon(type: "DRAGON", color: Color(red: 102/255, green: 0, blue: 1))
        case .rock: return typeIcon(type: "ROCK", color: Color(red: 153/255, green: 115/255, blue: 0))
        case .mono_type: return typeIcon(type: "MONO", color: Color(red: 230/255, green: 230/255, blue: 230/255))
        case .one: return typeIcon(type: "1", color: Color.black)
        case .two: return typeIcon(type: "2", color: Color.black)
        case .three: return typeIcon(type: "3", color: Color.black)
        case .four: return typeIcon(type: "4", color: Color.black)
        case .five: return typeIcon(type: "5", color: Color.black)
        case .six: return typeIcon(type: "6", color: Color.black)
        case .seven: return typeIcon(type: "7", color: Color.black)
        case .eight: return typeIcon(type: "8", color: Color.black)
        case .nine: return typeIcon(type: "9", color: Color.black)
        }
    }

}

enum Stat {
    case hp
    case attack
    case defense
    case sp_attack
    case sp_defense
    case speed
    
    var value: String {
        switch self{
        case .hp: return "HP"
        case .attack: return "Attack"
        case .defense: return "Defense"
        case .sp_attack: return "Special Attack"
        case .sp_defense: return "Special Defense"
        case .speed: return "Speed"
        }
    }
}

enum Origin_Generation {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var value: String {
        switch self {
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        }
    }
}

func getRandomType_Gen() -> [Type_Gen] {
    let types_gens: [Type_Gen] = [
        .water, .fire, .grass, .bug, .poison, .normal, .electric, .ice,
        .fighting, .ground, .flying, .psychic, .ghost, .dark, .steel,
        .fairy, .dragon, .rock, .mono_type,
        .one, .two, .three, .four, .five, .six, .seven, .eight, .nine
    ]
    
    var parameters: [Type_Gen] = []
    var number_added = false
    
    
    while parameters.count < 4 {
        let temp_param = types_gens.randomElement()!
        
//        print("Value of number added: ", number_added)
        
        // make sure only 1 int value gets added in the array
        if Int(temp_param.string_value) != nil, !number_added {
//            print("inside if statement: \(temp_param.string_value)")
            parameters.append(temp_param)
            number_added = true
        }
        
        // make sure each element in array is unique
        if !parameters.contains(temp_param){
            // make sure the temp_param being added isnt a number
            if Int(temp_param.string_value) != nil {
                continue
            } else {
//                print("inside else if statement: \(temp_param.string_value)")
                parameters.append(temp_param)
            }
        }
//        print(parameters)
    }
//    print("Final parameters: ", parameters)
    
    return parameters
}

func getRandomStat() -> Stat {
    let stats: [Stat] = [
        .hp,
        .attack,
        .defense,
        .sp_attack,
        .sp_defense,
        .speed
    ]
    
    return stats.randomElement()!
}

// I learned you can store multiple different types in a single array using this:
// https://stackoverflow.com/questions/38198672/creating-collection-of-different-enums
func getRandomStat_Gen() -> Any {
    let stats: [Stat] = [.hp, .attack, .defense, .sp_attack, .sp_defense, .speed, .hp, .attack, .defense, .sp_attack, .sp_defense, .speed]
    let gen: [Origin_Generation] = [.one, .two, .three, .four, .five, .six, .seven, .eight, .nine]
    
    let combination: [Any] = stats + gen
    
    return combination.randomElement()!
}

func getRandomGen(pokemon1: Pokemon, pokemon2: Pokemon) -> Int {
    var random_gen: [Int] = []
    
    random_gen.append(pokemon1.gen)
    random_gen.append(pokemon2.gen)
    
    return random_gen.randomElement()!
}

func statResult(stat: Stat?, pokemon1: Pokemon?, pokemon2: Pokemon?, isEqual: Bool) -> Bool {
    
    guard let pokemon1 = pokemon1, let pokemon2 = pokemon2, let stat = stat else {return false}
    
    if isEqual {
        switch stat{
        case .hp:
            print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.hp), \(pokemon2.name): \(pokemon2.hp)")
            if pokemon1.hp == pokemon2.hp {return true} else {return false}
        case .attack:
            print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.attack), \(pokemon2.name): \(pokemon2.attack)")
            if pokemon1.attack == pokemon2.attack {return true} else {return false}
        case .defense:
            print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.defense), \(pokemon2.name): \(pokemon2.defense)")
            if pokemon1.defense == pokemon2.defense {return true} else {return false}
        case .sp_attack:
            print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.sp_attack), \(pokemon2.name): \(pokemon2.sp_attack)")
            if pokemon1.sp_attack == pokemon2.sp_attack {return true} else {return false}
        case .sp_defense:
            print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.sp_defense), \(pokemon2.name): \(pokemon2.sp_defense)")
            if pokemon1.sp_defense == pokemon2.sp_defense {return true} else {return false}
        case .speed:
            print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.speed), \(pokemon2.name): \(pokemon2.speed)")
            if pokemon1.speed == pokemon2.speed {return true} else {return false}
        }
    }
    
    switch stat{
    case .hp:
        print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.hp), \(pokemon2.name): \(pokemon2.hp)")
        if pokemon1.hp > pokemon2.hp {return true} else {return false}
    case .attack:
        print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.attack), \(pokemon2.name): \(pokemon2.attack)")
        if pokemon1.attack > pokemon2.attack {return true} else {return false}
    case .defense:
        print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.defense), \(pokemon2.name): \(pokemon2.defense)")
        if pokemon1.defense > pokemon2.defense {return true} else {return false}
    case .sp_attack:
        print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.sp_attack), \(pokemon2.name): \(pokemon2.sp_attack)")
        if pokemon1.sp_attack > pokemon2.sp_attack {return true} else {return false}
    case .sp_defense:
        print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.sp_defense), \(pokemon2.name): \(pokemon2.sp_defense)")
        if pokemon1.sp_defense > pokemon2.sp_defense {return true} else {return false}
    case .speed:
        print("\(stat): \(stat.value), \(pokemon1.name): \(pokemon1.speed), \(pokemon2.name): \(pokemon2.speed)")
        if pokemon1.speed > pokemon2.speed {return true} else {return false}
    }
}

func genResult(equals: Bool, pokemon1: Pokemon?, pokemon2: Pokemon?, gen: Int) -> Bool {
    if equals, pokemon1 != nil, pokemon2 != nil {
        
        print("\(gen), \(pokemon1!.name): \(pokemon1!.gen), \(pokemon2!.name): \(pokemon2!.gen)")
        if pokemon1?.gen == gen, pokemon2?.gen == gen {return true} else {return false}
        
    } else {
        
        if let check = pokemon1 {
            print("\(gen), \(pokemon1!.name): \(pokemon1!.gen)")
            if check.gen == gen {return true}
            
        } else if let check = pokemon2 {
            print("\(gen), \(pokemon2!.name): \(pokemon2!.gen)")
            if check.gen == gen {return true}
            
        } else {
            return false
        }
        
    }
    print("Exited all if statements")
    return false
}
