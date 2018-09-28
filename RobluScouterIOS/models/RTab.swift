//
//  RTab.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RTab {
    
    private var ID: Int?;

    private var team: RTeam?;
    
    /*
     * Meta data
     */
    private var status: Int?;
    private var nameTag: String?;
    private var time: Int64?;
    private var customRelevance: Int?;
    
    // Empty constructor required for deserialization
    init() {}
    
    init(team: Rteam) {
        self.team = team;
    }
}


