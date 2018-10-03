//
//  RForm.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RForm {
    
    public var pit:[RMetric]?;
    public var match:[RMetric]?;
    
    init() {}
    
    init(pit:[RMetric], match:[RMetric]) {
        self.pit = pit;
        self.match = match;
    }
    
}
