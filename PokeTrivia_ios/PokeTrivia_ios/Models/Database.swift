//
//  Database.swift
//  PokeTrivia_ios
//
//  Created by Milton Tomasino on 6/14/24.
//

import Foundation
import SQLite
import Combine

class PokemonDB: ObservableObject {
    
    static let shared = PokemonDB()
    @Published var connection: Connection?
    
    private init() {
        connect()
    }
    
    func connect(){
        do {
            
            if let dbPath = Bundle.main.path(forResource: "PokemonDB", ofType: "db") {
                print("Database path: \(dbPath)")
                connection = try Connection(dbPath)
                print("Successfully connected to database")
            } else {
                print("Database file not found")
            }
            
        } catch {
            print("Unable to connect to database. Error: \(error)")
        }
    }
    
    func fetchPokemon() -> [Pokemon]{
        
        var list: [Pokemon] = []
        
        do {
            guard let success = connection else {
                print("Failed to connect to database")
                return list
            }
            
            let query = "SELECT * FROM Pokemon;"
            for row in try success.prepare(query) {
                if
                    let dn = row[1] as? Int64,
                    let name = row[2] as? String,
                    let gen = row[4] as? Int64,
                    let pic1 = row[5] as? String,
                    let pic2 = row[6] as? String,
                    let dp = row[7] as? String,
                    
                    let bst = row[10] as? Int64,
                    let hp = row[11] as? Int64,
                    let a = row[12] as? Int64,
                    let d = row[13] as? Int64,
                    let sp_a = row[14] as? Int64,
                    let sp_d = row[15] as? Int64,
                    let spd = row[16] as? Int64,
                    let de = row[17] as? String
                {
                    var form: String? = nil
                    
                    if let result = row[3] as? String {
                        print("form is null for \(String(describing: name))")
                        form = result
                    }
                    var types: [String] = []
                    types.append(row[8] as! String)

                    if let result = row[9] as? String {
                        types.append(result)
                    }
                    
                    let pokemon = Pokemon(dex_num: Int(dn), name: name, form: form, gen: Int(gen),
                                          pic1: pic1, pic2: pic2, details_path: dp,
                                          types: types, bst: Int(bst), hp: Int(hp),
                                          attack: Int(a), defense: Int(d), sp_attack: Int(sp_a),
                                          sp_defense: Int(sp_d), speed: Int(spd), dex_entry_url: de)
                    list.append(pokemon)
                }
                
            }
        } catch {
            print("Failed to fetch data. Error: \(error)")
        }
        
        return list
    }
}


