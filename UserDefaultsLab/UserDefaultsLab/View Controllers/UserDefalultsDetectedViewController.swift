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

}
