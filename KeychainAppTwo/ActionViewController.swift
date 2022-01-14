//
//  ActionViewController.swift
//  KeychainAppTwo
//
//  Created by Felix on 13.01.2022.
//

import UIKit
import KeychainSwift

class ActionViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let keychain = KeychainSwift()
        let accessGroup = "group.com.mobiledevelopment.rss" // added prefix for group
        SharedKeychainSwift.start(withKeychain: keychain, accessGroup: accessGroup)
    }

    private func setupUI() {
        getButton.layer.cornerRadius = 8
    }
    
    @IBAction func getActionButton(_ sender: UIButton) {
        
    }

}
