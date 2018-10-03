//
//  RStopwatch.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RStopwatch : RMetric {
    
    // Current time on the stopwatch
    public var time: Double;
    // Laps counter
    public var times: [Double]?;
    
    init(ID: Int, title: String, time: Double) {
        self.time = time;
        super.init(ID: ID, title: title);
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Stopwatch\nDefault value: " + String(time);
    }
    
    override func clone() -> RMetric {
        return RStopwatch(ID: self.ID, title: self.title, time: self.time);
    }
    
    override func toString() -> String {
        return String(time);
    }
    
}
