//
//  Array-Resort.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 08/11/24.
//

import Foundation

extension Array where Element == Resort {
    func sortBy(_ type: ShortBy) -> [Resort] {
        var temp = self
        switch type {
        case .alhabet:
            temp = self.sorted(by: {
                $0.name < $1.name
            })
        case .country:
            temp = self.sorted(by: {
                $0.country < $1.country
            })
        case .none:
            break
        }
        return temp
    }
}
