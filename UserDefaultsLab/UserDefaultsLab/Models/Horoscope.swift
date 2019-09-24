//
//  Horoscope.swift
//  UserDefaultsLab
//
//  Created by Jason Ruan on 9/24/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import Foundation

struct Horoscope: Codable {
    let sunsign: String
    let date: String
    let horoscope: String
    let meta: MetaWrapper
    
    struct MetaWrapper: Codable {
        let mood: String
        let keywords: String
        let intensity: String
    }
}
