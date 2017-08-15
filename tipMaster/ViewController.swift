//
//  ViewController.swift
//  tipMaster
//
//  Created by Sathyanarayanan Srinivasan on 8/13/17.
//  Copyright © 2017 Sathyanarayanan Srinivasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var personCountStepper: UIStepper!
    @IBOutlet weak var personCountLabel: UILabel!
    @IBOutlet weak var tipPercentageSliderValueLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
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
        let billAmount = (Double(billField.text!) ?? 0)
        let tipAmount = (billAmount * Double(tipPercentageSlider.value) * 0.01)
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", (billAmount + tipAmount) / personCountStepper.value)
    }
    
    @IBAction func incrementPersons(_ sender: Any) {
        personCountLabel.text = String(format: "%.0f", personCountStepper.value)
    }
}

