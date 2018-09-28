//
//  RCheckbox.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

// Represents a list of checkboxes that have a title and a TRUE or FALSE value
class RCheckbox : RMetric {
    
    public var values: [(item: String, value: Bool)]?;
    
    init(ID: Int, title: String, values: [(item: String, value: Bool)]) {
        self.values = values;
        super.init(ID: ID, title: title);
        if(values.count == 0) {
            fatalError("Values cannot be null or empty, this should be caught by the form editor");
        }
    }
    
    override func getFormDescriptor() -> String {
        var desc: String = "Type: Checkbox\nItems: (key, defaultValue) ";
        for i in values! {
            desc += "(" + String(i.0) + ", " + String(i.1) + ")";
        }
        return desc;
    }
    
    override func clone() -> RMetric {
        return RCheckbox(ID: self.ID, title: self.title, values: self.values!);
    }
    
}
