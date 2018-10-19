//
//  RCheckout.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 10/19/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RCheckout {
    
    // Content
    public var ID: Int?;
    public var team: RTeam?;

    // Meta
    public var status: Int?;
    public var nameTag: String?;
    public var time: Int64?;

    public var customRelevance: Int?; // transient!
    
    init(team: RTeam) {
        self.team = team;
    }
    
}
