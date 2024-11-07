//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 07/11/24.
//

import SwiftUI

@Observable
class Favorites {
    /// the actual resorts the user has favorited
    private var resorts: Set<String>
    
    /// the key we're using to read/write in UserDefaults
    private let key = "Favorites"
    
    init() {
        /// Load saved data
        
        self.resorts = []
    }
    
    /// return true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        return resorts.contains(resort.id)
    }
    
    /// add resort to saved local
    func add(_ resort: Resort){
        resorts.insert(resort.id)
        save()
    }
    
    /// remove resort from saved local
    func remove(_ resort: Resort){
        resorts.remove(resort.id)
        save()
    }
    
    private func save() {
        /// write save data
    }
}
