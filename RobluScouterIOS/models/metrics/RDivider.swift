//
//  RDivider.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

class RDivider : RMetric {
    
    required init?(map: Map) {
        super.init(ID: 0, title: "");
    }
    
    override init(ID: Int, title: String) {
        super.init(ID: ID, title: title);
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Divider\nDefault value: "+self.title!;
    }
    
    override func clone() -> RMetric {
        return RDivider(ID: self.ID!, title: self.title!);
    }
    
    override func mapping(map: Map) {
        // Nothing
    }
    
}
