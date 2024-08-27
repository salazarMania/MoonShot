//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by SANIYA KHATARKAR on 01/07/24.
//

import Foundation

extension Bundle{
    //here T is a placeholder for any kind of data you ask for
    func decode <T: Codable>(_ file: String) ->  T{
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle.")
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        //mm- minutes
        //MM-months
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do{
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context){
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)'- \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context){
            fatalError("Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type , let context){
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_){
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        }catch{
            //pokemon catch- catching all errors
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
    
}
