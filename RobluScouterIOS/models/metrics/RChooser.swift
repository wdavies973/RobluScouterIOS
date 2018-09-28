//
//  RChooser.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

// Represents a list of items of which only one can be selected
class RChooser : RMetric {
    
    public var values: [String]?;
    public var selectedIndex: Int; // the index of a value in {values} that is currently selected
    
    init(ID: Int, title: String, values: [String], selectedIndex: Int) {
        self.values = values;
        self.selectedIndex = selectedIndex;
        super.init(ID: ID, title: title);
    }
    
    override func getFormDescriptor() -> String {
        var desc: String = "";
        for i in values! {
            desc += i + ", ";
        }
        desc += " Default value index: " + String(self.selectedIndex);
        return desc;
    }
    
    override func clone() -> RMetric {
        return RChooser(ID: self.ID, title: self.title, values: self.values!, selectedIndex: self.selectedIndex);
    }
    
}
