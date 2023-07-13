//
//  Helpers.swift
//  PokemonApp
//
//  Created by mai nguyen on 7/13/23.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(fileName: String) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("Could not find \(fileName) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not find \(fileName) in bundle")

        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else{
            fatalError("Could not find \(fileName) in bundle")

        }
        
        return loadedData
        
    }
    
    func fetchData<T: Decodable>(url: String, model: T.Type, completion: @escaping(T) -> (), failure: @escaping(Error) -> ()) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if data != nil , error == nil {
                let jsonDecoder = JSONDecoder()
                do {
                    let objects = try jsonDecoder.decode(T.self, from: data!)
                    completion(objects)
                } catch {
                    failure(error)
                }
            }
        }
        .resume()
    }
}
