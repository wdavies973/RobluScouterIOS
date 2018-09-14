//
//  RMetric.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RMetric {
    
    var ID: Int;
    var title: String;
    var modified: Bool;
    
    init(ID: Int, title: String) {
        self.ID = ID;
        self.title = title;
        self.modified = false;
    }
    
    public func getFormDescriptor() -> (String) {
        preconditionFailure("This method must be overriden by its children");
    }
    
    public func clone() -> (RMetric) {
        preconditionFailure("This method must be overriden by its children");
    }
    
}
