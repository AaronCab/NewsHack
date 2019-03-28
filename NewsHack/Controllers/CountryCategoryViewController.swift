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
    
    private func setImage(countryName: String){
        switch countryName {
        case "USA":
            profileImage.image = UIImage.init(named: CountryNames.USA.rawValue)
        case "UnitedArabEmirates":
            profileImage.image = UIImage.init(named: CountryNames.UnitedArabEmirates.rawValue)
        case "Argentina":
            profileImage.image = UIImage.init(named: CountryNames.Argentina.rawValue)
        case "Austria":
            profileImage.image = UIImage.init(named: CountryNames.Austria.rawValue)
        case "Australia":
            profileImage.image = UIImage.init(named: CountryNames.Australia.rawValue)
        case "Belgium":
            profileImage.image = UIImage.init(named: CountryNames.Belgium.rawValue)
        case "Bulgaria":
            profileImage.image = UIImage.init(named: CountryNames.Bulgaria.rawValue)
        case "Brazil":
            profileImage.image = UIImage.init(named: CountryNames.Brazil.rawValue)
        case "Canada":
            profileImage.image = UIImage.init(named: CountryNames.Canada.rawValue)
        case "Switzerland":
            profileImage.image = UIImage.init(named: CountryNames.Switzerland.rawValue)
        case "China":
            profileImage.image = UIImage.init(named: CountryNames.China.rawValue)
        case "Colombia":
            profileImage.image = UIImage.init(named: CountryNames.Colombia.rawValue)
        case "Cuba":
            profileImage.image = UIImage.init(named: CountryNames.Cuba.rawValue)
        default:
            print("no image")
        }
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
        usernameLabel.text = "\(CountryNames.allCases[row])"
        setImage(countryName: "\(CountryNames.allCases[row])")
        
    }
}
