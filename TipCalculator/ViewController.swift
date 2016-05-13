//
//  ViewController.swift
//  TipCalculator
//
//  Created by Paul Mullan on 12/05/2016.
//  Copyright © 2016 PJM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var taxPctSlider: UISlider!
    @IBOutlet weak var taxPctLabel: UILabel!
    @IBOutlet weak var resultsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }
    
    @IBAction func calculatorTapped(sender: UIButton) {
        tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        //let sortedPossibleTips = sorted(possibleTips) { $0.0 < $1.0 }
        for (tipPct, tipVal) in possibleTips {
            results += "\(tipPct)%: \(String(format: "%0.2f", tipVal))\n"
        }
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender: UISlider) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: UITapGestureRecognizer) {
        totalTextField.resignFirstResponder()
    }
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI()
    {
        //print("Total: \(tipCalc.total)")
        totalTextField.text = String(tipCalc.total)
        //print("String format = \(String(format: "0.2f", tipCalc.total))")
        taxPctSlider.value = Float(tipCalc.taxPct * 100.0)
        taxPctLabel.text = "Tax Percent (\(Int(taxPctSlider.value)))%:"
        resultsTextView.text = ""
    }
    
}

