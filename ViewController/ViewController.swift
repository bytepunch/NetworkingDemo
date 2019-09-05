//
//  ViewController.swift
//  NetworkingDemo
//
//  Created by Jörg Klausewitz on 04.09.19.
//  Copyright © 2019 Jörg Klausewitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Outlets
    @IBOutlet weak var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    
    @IBAction func didClickOnConnectButton(_ sender: UIButton) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        let contactsManager = ContactsManager()
        self.connectButton.setTitle("Connecting...", for: .normal)
        self.connectButton.isEnabled = false
        contactsManager.fetchContact { (success) in

            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                print(success)
                self.connectButton.setTitle("Finishing connection", for: .normal)
            }

        }
        
    }
    
}




