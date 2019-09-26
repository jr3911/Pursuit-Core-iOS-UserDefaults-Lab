//
//  HoroscopeResultsViewController.swift
//  UserDefaultsLab
//
//  Created by Jason Ruan on 9/24/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class HoroscopeResultsViewController: UIViewController {
    //MARK: - Properties
    var username: String!
    var astrologicalSign: String!
    var horoscope: Horoscope?
    
    //MARK: - IBOutlets
    @IBOutlet weak var detailUserLabel: UILabel!
    @IBOutlet weak var detailUserSignLabel: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var keywordsLabel: UILabel!
    @IBOutlet weak var intensityLabel: UILabel!
    @IBOutlet weak var horoscopeTextView: UITextView!
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHoroscope()
    }
    
    //MARK: - Custom Functions
    private func loadHoroscope() {
        HoroscopeAPIClient.manager.getHoroscope(astrologicalSign: self.astrologicalSign) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let horoscopeInfo):
                self.horoscope = horoscopeInfo
                self.setUpHoroscopeViews()
            }
        }
    }
    
    private func setUpHoroscopeViews() {
        guard let horoscope = self.horoscope else { return }
        detailUserLabel.text = self.username
        detailUserSignLabel.text = astrologicalSign
        moodLabel.text = "Mood: \(horoscope.meta.mood)"
        keywordsLabel.text = "Keywords: \(horoscope.meta.keywords)"
        intensityLabel.text = "Intensity: \(horoscope.meta.intensity)"
        horoscopeTextView.text = horoscope.horoscope
    }

}
