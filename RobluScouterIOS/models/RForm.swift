//
//  RForm.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

class RForm : Mappable {
    
    public var pit:[RMetric]?;
    public var match:[RMetric]?;
    
    required init?(map: Map) {
        
    }
    
    init(pit:[RMetric], match:[RMetric]) {
        self.pit = pit;
        self.match = match;
    }
    
    // Defines mapping to and from
    func mapping(map: Map) {
        //self.pit = Mapper<RMetric>().mapArray(JSONObject: map["pit"].JSON);
        //self.match = Mapper<RMetric>().mapArray(JSONObject: map["match"].JSON);
        
        pit <- map["pit"]
        match <- map["match"]
    }
}
