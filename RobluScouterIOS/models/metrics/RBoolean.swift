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
    
    private var value: Bool;
    
    init(_ ID: Int, _ title: String, _ value: Bool) {
        self.value = value;
        super.init(ID: ID, title: title);
    }
    
    override func getFormDescriptor() -> (String) {
        return "Type: Boolean\nDefault value: " + String(value);
    }
    
    override func clone() -> (RMetric) {
        return RBoolean(self.ID, self.title, self.value);
    }
    
}
