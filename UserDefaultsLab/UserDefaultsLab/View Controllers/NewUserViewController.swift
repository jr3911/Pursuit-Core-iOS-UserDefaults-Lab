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
        setUsername()
        setBirthday()
        let userDefaultVC = storyboard?.instantiateViewController(withIdentifier: "UserDefalultsDetectedViewController") as! UserDefalultsDetectedViewController
        userDefaultVC.username = self.username
        self.navigationController?.pushViewController(userDefaultVC, animated: true)
    }
    
    @IBAction func datePickerWasScrolled(_ sender: UIDatePicker) {
        setBirthday()
    }
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    
    //MARK: - Custom Functions
    private func setBirthday() {
        let date = birthdayDatePicker.date.description(with: .current).components(separatedBy: " ")
        let month = date[1]
        let day = date[2].replacingOccurrences(of: ",", with: "")
        birthday = [month, day]
        print(birthday)
    }
    
    private func setUsername() {
        if let username = nameTextField.text {
            self.username = username
        } else {
            username = ""
        }
    }
    
}

extension NewUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setUsername()
        nameTextField.resignFirstResponder()
        return true
    }
}
