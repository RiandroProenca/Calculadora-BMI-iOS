//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Riandro Proença on 18/08/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

var bmi: BMI?


struct CalculatorBrain {
   
    func getBMIValue() -> String {
        let bmiResult = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiResult
       
    }
    
    mutating func calculateBMI(heigth:Float, weight: Float){
       let bmiValue = weight / pow(heigth, 2)
        
        if bmiValue <= 18.5{
            bmi = BMI(value: bmiValue, advice: "Abaixo do Peso", color:#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
            } else if  bmiValue < 24.9  {
                bmi = BMI(value: bmiValue, advice: "Peso normal", color:#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
                }else{
                    bmi = BMI(value: bmiValue, advice: "Acima do Peso", color:#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
                   
           }
        
    
    }
    func getAdvice() ->String{
        
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor{
    
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
