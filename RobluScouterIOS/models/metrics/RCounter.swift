//
//  RCounter.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

// RCounter stores a numerical value
class RCounter : RMetric {
    
    public var value: Double?;
    public var increment: Double?;
    public var verboseInput: Bool?; // if true, instead of the UI loading '+' & '-' buttons, the user can just input a raw value
    
    required init?(map: Map) {
        super.init(ID: 0, title: "")
    }

    init(ID: Int, title: String, increment: Double, value: Double) {
        super.init(ID: ID, title: title);
        self.value = value;
        self.increment = increment;
        self.verboseInput = false;
    }
    
    func add() {
        value! += increment!;
    }
    
    func minus() {
        value! -= increment!;
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Counter\nDefault value" + String(value!)+"\nIncrement: "+String(increment!);
    }
    
    override func clone() -> RMetric {
        let counter: RCounter = RCounter(ID: self.ID!, title: self.title!, increment: self.increment!, value: self.value!);
        counter.verboseInput = self.verboseInput;
        return counter;
    }
    
    // Not sure if this is needed yet or not
    //public String getTextValue() {
    //if((int)value == value && (int)increment == increment) return String.valueOf((int)value);
    //else return String.valueOf(Utils.round(value, 2));
    //}
    override func mapping(map: Map) {
        value <- map["value"];
        increment <- map["increment"];
        verboseInput <- map["verboseInput"];
    }
    
}
