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
    
    var birthday: [String] = [] {
        didSet {
            defaults.set(birthday, forKey: "birthday")
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    //MARK: - IBActions
    @IBAction func setUserDefaultsButtonPressed(_ sender: UIButton) {
        let userDefaultVC = storyboard?.instantiateViewController(withIdentifier: "UserDefalultsDetectedViewController") as! UserDefalultsDetectedViewController
        userDefaultVC.username = self.username
        self.navigationController?.pushViewController(userDefaultVC, animated: true)
        
    }
    
    @IBAction func datePickerWasScrolled(_ sender: UIDatePicker) {
        let date = sender.date.description(with: .current).components(separatedBy: " ")
        let month = date[1]
        let day = date[2].replacingOccurrences(of: ",", with: "")
        birthday = [month, day]
    }
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    
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
