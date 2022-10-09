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
    
    
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        heightLabel.text?.append("m")
        weightLabel.text?.append("Kg")
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        let currentHeight = String(format: "%.2f", sender.value)
//        print(currentHeight)
        
        heightLabel.text = "\(currentHeight)m"
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let currentWeight = Int(sender.value)
        weightLabel.text = "\(currentWeight)Kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        
        calculatorBrain.calculateBMI(height:heightSlider.value,weight:weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
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

