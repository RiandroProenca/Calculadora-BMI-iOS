//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let changeHeight = sender.value
        let printHeight = String(format: "%.2f", changeHeight)
        heightLabel.text = "\(printHeight)m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let changeWeight = Int(sender.value)
        weightLabel.text = "\(changeWeight)kg"
    }
    
    @IBAction func calculetePressed(_ sender: UIButton) {
        let heigth = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(heigth: heigth,weight:weight)
        
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }
    
}
