//
//  HoroscopeAPIClient.swift
//  UserDefaultsLab
//
//  Created by Jason Ruan on 9/24/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import Foundation

class HoroscopeAPIClient {
    //MARK: - Private Properties and Initializers
    private init() {}
    static let manager = HoroscopeAPIClient()
    
    func getHoroscope(astrologicalSign: String, completionHandler: @escaping (Result<Horoscope, AppError>) -> () ) {
        let urlString = "http://sandipbgt.com/theastrologer/api/horoscope/\(astrologicalSign.lowercased())/today"
        guard let url = URL(string: urlString) else { return }
        NetworkHelper.manager.performDataTask(withURL: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let horoscopeInfo = try JSONDecoder().decode(Horoscope.self, from: data)
                    completionHandler(.success(horoscopeInfo))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
