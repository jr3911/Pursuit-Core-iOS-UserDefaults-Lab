//
//  UserDefalultsDetectedViewController.swift
//  UserDefaultsLab
//
//  Created by Jason Ruan on 9/24/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class UserDefalultsDetectedViewController: UIViewController {
    //MARK: - Properties
    var username: String!
    var astrologicalSign: String!
    
    //MARK: IBOutlets
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var userSignLabel: UILabel!

    //MARK: - IBActions
    @IBAction func revealButtonPressed(_ sender: UIButton) {
        if let astrologicalSign = self.astrologicalSign {
            prepareNextViewController(astrologicalSign: astrologicalSign)
        } else {
            print("cant do that")
            return
        }
    }
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailWelcomeViews()
    }
    
    //MARK: Custom Functions
    private func setUpDetailWelcomeViews() {
        welcomeLabel.text = "Welcome, \(username.description)!"
        userSignLabel.text = astrologicalSign.uppercased()
    }
    
    private func prepareNextViewController(astrologicalSign: String) {
        let horoscopeResultsVC = storyboard?.instantiateViewController(withIdentifier: "HoroscopeResultsViewController") as! HoroscopeResultsViewController
        horoscopeResultsVC.astrologicalSign = astrologicalSign
        self.navigationController?.pushViewController(horoscopeResultsVC, animated: true)
    }

}
