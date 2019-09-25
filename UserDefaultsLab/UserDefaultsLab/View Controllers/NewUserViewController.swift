//
//  NewUserViewController.swift
//  UserDefaultsLab
//
//  Created by Jason Ruan on 9/24/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {
    //MARK: Properties
    let defaults = UserDefaults.standard
    
    var username = "" {
        didSet {
            defaults.set(username, forKey: "username")
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    //MARK: - IBActions
    @IBAction func setUserDefaultsButtonPressed(_ sender: UIButton) {
    }
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            username = text
        }
        nameTextField.resignFirstResponder()
        return true
    }
}
