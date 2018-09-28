//
//  RDivider.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RDivider : RMetric {
    
    override func getFormDescriptor() -> String {
        return "Type: Divider\nDefault value: "+self.title;
    }
    
    override func clone() -> RMetric {
        return RDivider(ID: self.ID, title: self.title);
    }
    
}
