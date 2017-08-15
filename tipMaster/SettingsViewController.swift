//
//  SettingsViewController.swift
//  tipMaster
//
//  Created by Sathyanarayanan Srinivasan on 8/14/17.
//  Copyright © 2017 Sathyanarayanan Srinivasan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        let defaults = UserDefaults.standard
        defaultTipField.text = String(format: "%.2f", defaults.float(forKey: "default_tip_percentage"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTipField.becomeFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func updateDefaultTipPercentage(_ sender: Any) {
        let defaults = UserDefaults.standard
        let defaultTipValue = Float(defaultTipField.text!) ?? 0
        defaults.set(defaultTipValue, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
}
