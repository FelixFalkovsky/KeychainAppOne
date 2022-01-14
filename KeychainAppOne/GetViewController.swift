//
//  GetViewController.swift
//  KeychainAppOne
//
//  Created by Felix on 12.01.2022.
//

import Foundation
import UIKit
import KeychainSwift

class GetViewController: UIViewController {
    
    let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)
    
    let profileImageButtonHeight: CGFloat = 120
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var passwordLabel: UILabel!
    @IBOutlet private var getFromKeychainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc
    private func actionProfileImageTapped() {
        
    }
    
    private func setupUI() {
        getFromKeychainButton.layer.cornerRadius = 8
        keychain.synchronizable = true
    }
    
    @IBAction func getFromKeychainButtonTapped(_ sender: UIButton) {
        guard let name = keychain.getData(Keys.name) else { return }
        guard let password = keychain.getData(Keys.password) else { return }
        
        if keychain.lastResultCode != noErr { print(keychain.lastResultCode)}
        
        nameLabel.text = "Name: \(String(data: name, encoding: .utf8) ?? "")"
        passwordLabel.text = "Password: \(String(data: password, encoding: .utf8) ?? "")"
    }
    
    @objc
    private func getFromKeychainButtonTapped() {
        
    }
}
