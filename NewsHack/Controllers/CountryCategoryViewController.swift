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
    var selectedCountry = CountryNames.Argentina//"\(CountryNames.allCases[0])"
    //HeyCrisit, github
    @IBOutlet weak var pickerView: UIPickerView!
    private var gradient: CAGradientLayer!
    override func viewDidLoad() {
        addGradient()
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        sendCountryNameLabel()
    }
   private func sendCountryNameLabel(){
    performSegue(withIdentifier: "Unwind from Country Category ViewController", sender: self)
    }
    private func addGradient(){
        
        let firstColor = UIColor.init(red: 255/255, green: 0/255, blue: 204/255, alpha: 1)
        let secondColor = UIColor.init(red: 51/255, green: 51/255, blue: 153/255, alpha: 1)
        gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
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
        case "CzechRepublic":
            profileImage.image = UIImage.init(named: CountryNames.CzechRepublic.rawValue)
        case "Germany":
            profileImage.image = UIImage.init(named: CountryNames.Germany.rawValue)
        case "Egypt":
            profileImage.image = UIImage.init(named: CountryNames.Egypt.rawValue)
        case "France":
            profileImage.image = UIImage.init(named: CountryNames.France.rawValue)
        case "UK":
            profileImage.image = UIImage.init(named: CountryNames.UK.rawValue)
        case "Greece":
            profileImage.image = UIImage.init(named: CountryNames.Greece.rawValue)
        case "HongKong":
            profileImage.image = UIImage.init(named: CountryNames.HongKong.rawValue)
        case "Hungary":
            profileImage.image = UIImage.init(named: CountryNames.Hungary.rawValue)
        case "Indonesia":
            profileImage.image = UIImage.init(named: CountryNames.Indonesia.rawValue)
        case "Ireland":
            profileImage.image = UIImage.init(named: CountryNames.Ireland.rawValue)
        case "Israel":
            profileImage.image = UIImage.init(named: CountryNames.Israel.rawValue)
        case "India":
            profileImage.image = UIImage.init(named: CountryNames.India.rawValue)
        case "Italy":
            profileImage.image = UIImage.init(named: CountryNames.Italy.rawValue)
        case "Japan":
            profileImage.image = UIImage.init(named: CountryNames.Japan.rawValue)
        case "SKorea":
            profileImage.image = UIImage.init(named: CountryNames.SKorea.rawValue)
        case "Lithuania":
            profileImage.image = UIImage.init(named: CountryNames.Lithuania.rawValue)
        case "Latvia":
            profileImage.image = UIImage.init(named: CountryNames.Latvia.rawValue)
        case "Morocco":
            profileImage.image = UIImage.init(named: CountryNames.Morocco.rawValue)
        case "Mexico":
            profileImage.image = UIImage.init(named: CountryNames.Mexico.rawValue)
        case "Malaysia":
            profileImage.image = UIImage.init(named: CountryNames.Malaysia.rawValue)
        case "Nigeria":
            profileImage.image = UIImage.init(named: CountryNames.Nigeria.rawValue)
        case "Netherlands":
            profileImage.image = UIImage.init(named: CountryNames.Netherlands.rawValue)
        case "Norway":
            profileImage.image = UIImage.init(named: CountryNames.Norway.rawValue)
        case "NewZealand":
            profileImage.image = UIImage.init(named: CountryNames.NewZealand.rawValue)
        case "Philipines":
            profileImage.image = UIImage.init(named: CountryNames.Philipines.rawValue)
        case "Poland":
            profileImage.image = UIImage.init(named: CountryNames.Poland.rawValue)
        case "Portugal":
            profileImage.image = UIImage.init(named: CountryNames.Portugal.rawValue)
        case "Romania":
            profileImage.image = UIImage.init(named: CountryNames.Romania.rawValue)
        case "Serbia":
            profileImage.image = UIImage.init(named: CountryNames.Serbia.rawValue)
        case "Russia":
            profileImage.image = UIImage.init(named: CountryNames.Russia.rawValue)
        case "SaudiaArabia":
            profileImage.image = UIImage.init(named: CountryNames.SaudiaArabia.rawValue)
        case "Sweden":
            profileImage.image = UIImage.init(named: CountryNames.Sweden.rawValue)
        case "Singapore":
            profileImage.image = UIImage.init(named: CountryNames.Singapore.rawValue)
        case "Slovenia":
            profileImage.image = UIImage.init(named: CountryNames.Slovenia.rawValue)
        case "Slovakia":
            profileImage.image = UIImage.init(named: CountryNames.Slovakia.rawValue)
        case "SouthAfrica":
            profileImage.image = UIImage.init(named: CountryNames.SouthAfrica.rawValue)
        case "Thailand":
            profileImage.image = UIImage.init(named: CountryNames.Thailand.rawValue)
        case "Turkey":
            profileImage.image = UIImage.init(named: CountryNames.Turkey.rawValue)
        case "Taiwain":
            profileImage.image = UIImage.init(named: CountryNames.Taiwain.rawValue)
        case "Ukraine":
            profileImage.image = UIImage.init(named: CountryNames.Ukraine.rawValue)
        case "Venezuela":
            profileImage.image = UIImage.init(named: CountryNames.Venezuela.rawValue)
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
        selectedCountry = CountryNames.allCases[row]
        usernameLabel.text = "\(CountryNames.allCases[row])"
        setImage(countryName: "\(CountryNames.allCases[row])")
        
    }
}
