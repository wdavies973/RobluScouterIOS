//
//  RCalculation.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

// Represents a custom calculation with other metrics as variables
class RCalculation : RMetric {
    
    // Stores the last value of the calculation, call getValue() to update this
    public var lastValue: Double?;
    
    // Stores the symbolic formula in plaintext
    public var calculation: String?;
    
    required init?(map: Map) {
        super.init(ID: 0, title: "");
    }
    
    override init(ID: Int, title: String) {
        super.init(ID: ID, title: title);
        self.calculation = "";
        self.lastValue = 0.0;
    }
    
    // Substitutes actual values into the equation and computes a numerical result.
    // It returns as a String to make it easier to put into UI components
    func getValue(metrics:[RMetric]) -> String {
        if(calculation == "") { return "Bad equation"; }
        
        do {
            var equation: String = calculation!;
            
            for metric in metrics {
                
                // Skip the reference to ourself
                if(metric.title == self.title) {
                    continue;
                }
                
                // Replace the variable with the metric value, this will depend on the type of the metric
                // since we can only use metrics that support a numerical return type
                if(metric is RCounter || metric is RStopwatch || metric is RSlider) {
                    equation = equation.replacingOccurrences(of: metric.title!, with: metric.toString());
                }
                else if(metric is RCalculation) { // Also support using other RCalculations as inputs
                    if(equation.range(of: metric.title!) == nil) {
                        let rcalc = metric as? RCalculation;
                        equation = equation.replacingOccurrences(of: metric.title!, with: rcalc!.getValue(metrics: metrics));
                    }
                }
                
            }
            
            // Trim whitespace
            equation = equation.replacingOccurrences(of: " ", with: "");
            
            // At this point, the equation is now ready to be evaluated via a 3rd party library
            self.lastValue = 0; // this should be replaced by library call
            return String(self.lastValue!);
        } catch {
            return "Bad equation";
        }
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Calculation metric\nCalculation: " + calculation!;
    }
    
    override func clone() -> RMetric {
        let metric = RCalculation(ID: self.ID!, title: self.title!);
        metric.calculation = self.calculation;
        return metric;
    }
    
    override func toString() -> String {
        return String(lastValue!);
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map);
        lastValue <- map["lastValue"];
        calculation <- map["lastValue"];
    }
    
    
}
