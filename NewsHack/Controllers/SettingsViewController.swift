//
//  SettingsViewController.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var profileImage: CircularImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func usernamePressed(_ sender: Any) {
    }
    
    @IBAction func profileImageBttnPressed(_ sender: Any) {
    }
    
}
