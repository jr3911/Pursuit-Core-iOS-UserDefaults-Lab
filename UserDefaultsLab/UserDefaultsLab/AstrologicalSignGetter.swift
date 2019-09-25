//
//  AstrologicalSignGetter.swift
//  UserDefaultsLab
//
//  Created by Jason Ruan on 9/25/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import Foundation

class AstrologicalSignGetter {
    static func getAstrologicalSign(birthday: [String]) -> String {
        let month = birthday[0]
        let day = Int(birthday[1])!
        switch month {
        case "January":
            if day >= 20 {
                return "Aquarius"
            } else {
                return "Capricorn"
            }
        case "February":
            if day >= 19 {
                return "Pisces"
            } else {
                return "Aquarius"
            }
        case "March":
            if day >= 21 {
                return "Aries"
            } else {
                return "Pisces"
            }
        case "April":
            if day >= 20 {
                return "Taurus"
            } else {
                return "Aries"
            }
        case "May":
            if day >= 21 {
                return "Gemini"
            } else {
                return "Taurus"
            }
        case "June":
            if day >= 21 {
                return "Cancer"
            } else {
                return "Gemini"
            }
        case "July":
            if day >= 23 {
                return "Leo"
            } else {
                return "Cancer"
            }
        case "August":
            if day >= 23 {
                return "Virgo"
            } else {
                return "Leo"
            }
        case "September":
            if day >= 23 {
                return "Libra"
            } else {
                return "Virgo"
            }
        case "October":
            if day >= 23 {
                return "Scorpio"
            } else {
                return "Libra"
            }
        case "November":
            if day >= 22 {
                return "Sagittarius"
            } else {
                return "Scorpio"
            }
        case "December":
            if day >= 23 {
                return "Capricorn"
            } else {
                return "Sagittarius"
            }
        default:
            return "No sign available"
        }
    }
}
