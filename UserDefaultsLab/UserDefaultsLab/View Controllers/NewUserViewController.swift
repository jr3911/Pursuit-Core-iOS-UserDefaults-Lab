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
    
    var birthdayDate: Date = Date() {
        didSet {
            defaults.set(birthdayDate, forKey: "birthdayDate")
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    //MARK: - IBActions
    @IBAction func setUserDefaultsButtonPressed(_ sender: UIButton) {
        setBirthday()
        let sign = AstrologicalSignGetter.getAstrologicalSign(birthday: self.birthday)
        let userDefaultVC = storyboard?.instantiateViewController(withIdentifier: "UserDefalultsDetectedViewController") as! UserDefalultsDetectedViewController
        userDefaultVC.username = self.username
        userDefaultVC.astrologicalSign = sign
        self.navigationController?.pushViewController(userDefaultVC, animated: true)
    }
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        setInitialValuesFromUserDefaults()
        loadNewUserImage()
    }
    
    //MARK: - Custom Functions
    private func setBirthday() {
        birthdayDate = birthdayDatePicker.date
        let date = birthdayDatePicker.date.description(with: .current).components(separatedBy: " ")
        let month = date[1]
        let day = date[2].replacingOccurrences(of: ",", with: "")
        birthday = [month, day]
    }
    
    private func loadNewUserImage() {
        introImageView.image = UIImage(named: "astrologyBSWheel")
    }
    
    private func setInitialValuesFromUserDefaults() {
        if let storedUsername = defaults.value(forKey: "username") as? String {
            username = storedUsername
            nameTextField.text = storedUsername
        }
        if let storedBirthday = defaults.value(forKey: "birthday") as? [String] {
            birthday = storedBirthday
        }
        if let storedBirthdayDate = defaults.value(forKey: "birthdayDate") as? Date {
            birthdayDatePicker.date = storedBirthdayDate
        }
    }
    
}

extension NewUserViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            username = updatedText
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}
