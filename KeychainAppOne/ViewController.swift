//
//  ViewController.swift
//  KeychainAppOne
//
//  Created by Felix on 12.01.2022.
//

import UIKit
import KeychainSwift

struct Keys {
    static let name = "name"
    static let password = "password"
    static let keyPrefix = ""
}

class ViewController: UIViewController {
    
    let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)
    
    @IBOutlet private var userNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var sendButton: UIButton!
    @IBOutlet private var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUI()
    }
    
    private func settingUI() {
        sendButton.layer.cornerRadius = 8
        clearButton.layer.cornerRadius = 8
        userNameTextField.layer.cornerRadius = 16
        passwordTextField.layer.cornerRadius = 16
    }

    @IBAction func actionSendButton(_ sender: UIButton) {
        if userNameTextField.text != "" && passwordTextField.text != "" {
            
            guard let name = userNameTextField.text else { return }
            if keychain.set(name, forKey: Keys.name, withAccess: .accessibleWhenUnlocked) {
                print("Set \(name)")
            } else {
                print("Did nod set")
            }
                
            guard let password = passwordTextField.text else { return }
            if keychain.set(password, forKey: Keys.password, withAccess: .accessibleWhenUnlocked) {
                print("Set \(password)")
            }
        }
    }
    
    @IBAction func actionClearButton(_ sender: UIButton) {
        if keychain.clear() {
            print("Keychain Clear ⚠️")
        }
    }
}

