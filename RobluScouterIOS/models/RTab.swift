//
//  RTab.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

class RTab : Mappable {
    
    // RTabs are identified by their title, no duplicates!
    public var title: String?;
    
    public var metrics: [RMetric]?;
    
    // FALSE for blue alliance, TRUE for red alliance
    public var redAlliance: Bool?;
    
    /*
     * This is a helper variable for teams who use the Red Device, Blue Device, etc. scouting system.
     * This variable can only be imported from the TBA.
     * Values 1-3 represent red alliance, 4-6 represent Blue alliance position.
     * However, use the redAlliance variable for display colors, because that's what the user can
     * change and modify. This should ONLY be used for sorting the4 Red Device, Blue Device checkout order.
     */
    public var alliancePosition: Int?;
    
    // was the match won?
    public var won: Bool?;
    
    // The time that this match will occur, this is raw UNIX time, not a clean timestamp
    public var time: Int64?;
    
    // Stores a list of edits made to this RTab
    public var edits: [(author: String, time: Int64)]?;
    
    required init?(map: Map) {
        
    }
    
    init(title: String, metrics: [RMetric], redAlliance: Bool, won: Bool, time: Int64) {
        self.title = title;
        self.metrics = metrics;
        self.redAlliance = redAlliance;
        self.won = won;
        self.time = time;
        
        self.alliancePosition = 0; // disabled (probably)
    }
    
    func getSortValue() -> Int {
        var val: Int = 0;
        if(title!.lowercased().contains("quals")) {
            val += (100 + Int(title!.lowercased().split(separator: " ")[1])!);
        }
        else if(title!.lowercased().contains("quarters")) {
            val += (1000 + 10 * Int(title!.lowercased().split(separator: " ")[1])! + Int(title!.lowercased().split(separator: " ")[3])!);
        }
        else if(title!.lowercased().contains("semis")) {val += 10000;}
        else if(title!.lowercased().contains("finals")) {val += 100000;}
        
        return val;
    }
    
    func mapping(map: Map) {
        title <- map["title"];
        metrics <- map["metrics"];
        redAlliance <- map["redAlliance"];
        alliancePosition <- map["alliancePosition"];
        won <- map["won"];
        time <- map["time"];
        edits <- map["edits"];
    }
}


