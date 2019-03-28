//
//  SettingsViewController.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CountryCategoryViewController: UIViewController {
    @IBOutlet weak var profileImage: CircularImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    private var countryNames = [CountryNames]()
    private var selectedCountry = "\(CountryNames.allCases[0])"
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
   
    
}
extension CountryCategoryViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CountryNames.allCases.count
    }
}

extension CountryCategoryViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(CountryNames.allCases[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = "\(CountryNames.allCases[row])"
        
    }
}
