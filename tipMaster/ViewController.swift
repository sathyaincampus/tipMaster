//
//  ViewController.swift
//  tipMaster
//
//  Created by Sathyanarayanan Srinivasan on 8/13/17.
//  Copyright © 2017 Sathyanarayanan Srinivasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var personCountStepper: UIStepper!
    @IBOutlet weak var personCountLabel: UILabel!
    @IBOutlet weak var tipPercentageSliderValueLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    
    var amt: Int = 0
    var billAmount: Double = 0.00
    var currencySymbol = Locale.current.currencySymbol;

    override func viewDidLoad() {
        super.viewDidLoad()
        billField.delegate = self
        billField.placeholder = updateAmount()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
//        let currentLocale = Locale.current;
//        print("currency symbol \(currentLocale.currencySymbol)")
//        print("currency code \(currentLocale.currencyCode)")
//        for myLocale in NSLocale.availableLocaleIdentifiers {
//            print("\(myLocale)")
//        }
//        for regionCode in Locale.isoRegionCodes {
//            print(regionCode)
//        }
//        
//        for languageCode in Locale.isoLanguageCodes {
//            print(languageCode)
//        }
//        let localeIdentifiers = Locale.availableIdentifiers;
//        print (localeIdentifiers)
//        for id in localeIdentifiers{
//            print (id)
//        }
        
        if (tipPercentageSlider.value == 0){
            let defaults = UserDefaults.standard
            tipPercentageSlider.value = defaults.float(forKey: "default_tip_percentage")
            tipPercentageSliderValueLabel.text = String(format: "%.2f", tipPercentageSlider.value)
            calculateTip(self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.billField.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        billField.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        tipPercentageSliderValueLabel.text = String(format: "%.2f", tipPercentageSlider.value)
//        let billAmount = (Double(billField.text!) ?? 0)
        let tipAmount = (billAmount * Double(tipPercentageSlider.value) * 0.01)
        tipLabel.text = currencySymbol! + String(format: "%.2f", tipAmount)
        totalLabel.text = currencySymbol! + String(format: "%.2f", (billAmount + tipAmount) / personCountStepper.value)
    }
    
    @IBAction func incrementPersons(_ sender: Any) {
        personCountLabel.text = String(format: "%.0f", personCountStepper.value)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let digit = Int(string){
           amt = amt * 10 + digit
            billField.text = updateAmount()
        }
        if string == "" {
            amt = amt / 10
            billField.text = updateAmount()
        }
        return false
    }
    
    
    func updateAmount() -> String? {
      let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        let amount = Double (amt / 100) + Double(amt%100)/100
        billAmount = amount
        calculateTip(self)
        return formatter.string(from: NSNumber(value: amount))
    }
}

