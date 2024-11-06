//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 06/11/24.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key `\(key.stringValue)` -- \(context.debugDescription) ")
        } catch DecodingError.typeMismatch(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch of `\(type)` -- \(context.debugDescription) ")
        } catch DecodingError.valueNotFound(let value, let context) {
            fatalError("Failed to decode \(file) from bundle due to value not found of `\(value)` -- \(context.debugDescription) ")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Failed to decode \(file) from bundle due to data corrupted -- \(context.debugDescription) ")
        } catch {
            fatalError("Failed to decode \(file) from bundle -- \(error.localizedDescription) ")
        }
    }
}
