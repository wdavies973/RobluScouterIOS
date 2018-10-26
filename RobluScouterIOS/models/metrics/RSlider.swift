//
//  RSlider.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

// RSlider stores an integer that has a max and min value
class RSlider : RMetric {
    
    public var value: Int?;
    public var min: Int?;
    public var max: Int?;
    
    required init?(map: Map) {
        super.init(ID: 0, title: "")
    }
    
    init(ID: Int, title: String, min: Int, max: Int, value: Int) {
        super.init(ID: ID, title: title);
        self.min = min;
        self.max = max;
        self.value = value;
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Slider\nMin: " + String(min!) + " Max: " + " Default value: " + String(value!);
    }
    
    override func clone() -> RMetric {
        return RSlider(ID: self.ID!, title: self.title!, min: self.min!, max: self.max!, value: self.value!);
    }
    
    override func toString() -> String {
        return String(value!)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map);
        value <- map["value"]
        min <- map["min"]
        max <- map["max"]
    }
    
}
