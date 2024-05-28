//
//  PokemonData.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 5/27/24.
//

import Foundation

struct Pokemon: Codable, Identifiable{
    var id: UUID = UUID()
    var dex_num: Int
    var name: String
    var form: String?
    var gen: Int
    var pic1: String
    var pic2: String
    var details_path: String
    var types: [String]
    var bst: Int
    var hp: Int
    var attack: Int
    var defense: Int
    var sp_attack: Int
    var sp_defense: Int
    var speed: Int
    var dex_entry_url: String
    
    private enum CodingKeys: String, CodingKey {
            case dex_num, name, form, gen, pic1, pic2, details_path, dex_entry_url, types, bst, hp, attack, defense, sp_attack, sp_defense, speed
        }
}

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldin't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
        
    } catch {
        
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
        
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}



