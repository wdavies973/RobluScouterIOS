//
//  RCalculation.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

// Represents a custom calculation based off other methods
class RCalculation : RMetric {
    
    // Stores the last value of the calculation, call getValue() to update this
    var lastValue: Double;
    
    // Stores the symbolic formula in plaintext
    var calculation: String;
    
    init(ID: Int, title: String) {
        self.calculation = "";
        self.lastValue = 0.0;
        super.init(ID: ID, title: title);
    }
    
    override func getFormDescriptor() -> (String) {
        return "Type: Calculation metric\nCalculation: " + calculation;
    }
    
    override func clone() -> (RMetric) {
        let metric = RCalculation(ID: self.ID, title: self.title);
        metric.calculation = self.calculation;
        return metric;
    }
    
    // Substitutes actual values into the equation and computes a numerical result.
    // It returns as a String to make it easier to put into UI components
    func getValue(metrics:[RMetric]) -> (String) {
        if(calculation == "") { return "Bad equation"; }
        
        do {
            
            let equation = calculation;
            
            for metric in metrics {
                
                // Skip the reference to ourself
                if(metric.title == self.title) continue;
                

            }
            
        } catch {
            
        }
    }
    
    
    
    
}
