//
//  RBoolean.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

// Represents a Boolean metric storing a TRUE or FALSE value
class RBoolean : RMetric {
    
    public var value: Bool;
    
    init(ID: Int, title: String, value: Bool) {
        self.value = value;
        super.init(ID: ID, title: title);
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Boolean\nDefault value: " + String(value);
    }
    
    override func clone() -> RMetric {
        return RBoolean(ID: self.ID, title: self.title, value: self.value);
    }
    
}
