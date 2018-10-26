//
//  RBoolean.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

// Represents a Boolean metric storing a TRUE or FALSE value
class RBoolean : RMetric {
    
    public var value: Bool?;
    
    required init?(map: Map) {
        super.init(ID: 0, title: "");
    }
    
    init(ID: Int, title: String, value: Bool) {
        super.init(ID: ID, title: title);
        self.value = value;
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Boolean\nDefault value: " + String(value!);
    }
    
    override func clone() -> RMetric {
        return RBoolean(ID: self.ID!, title: self.title!, value: self.value!);
    }
    
    override func mapping(map: Map) {
        value <- map["value"];
    }
    
}
