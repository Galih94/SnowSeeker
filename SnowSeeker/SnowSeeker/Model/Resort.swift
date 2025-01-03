//
//  Resort.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 06/11/24.
//

import Foundation

struct Resort: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    
    static let exampleAllResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let exampleResorts = exampleAllResorts[0]
//    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
    
    var facilityTypes: [Facility] {
        return facilities.map {Facility(name: $0)}
    }
}
