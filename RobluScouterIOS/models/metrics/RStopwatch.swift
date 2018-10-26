//
//  RStopwatch.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

class RStopwatch : RMetric {
    
    // Current time on the stopwatch
    public var time: Double?;
    // Laps counter
    public var times: [Double]?;
    
    required init?(map: Map) {
        super.init(ID: 0, title: "");
    }
    
    init(ID: Int, title: String, time: Double) {
        super.init(ID: ID, title: title);
        self.time = time;
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Stopwatch\nDefault value: " + String(describing: time!);
    }
    
    override func clone() -> RMetric {
        return RStopwatch(ID: self.ID!, title: self.title!, time: self.time!);
    }
    
    override func toString() -> String {
        return String(time!);
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map);
        time <- map["time"]
        times <- map["times"]
    }
    
}
