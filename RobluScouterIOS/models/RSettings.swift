//
//  RSettings.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 10/19/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

class RSettings : Mappable {
    
    public var code: String?;
    public var name: String?;
    
    // Preferences
    public var showPit: Bool?;
    public var showCompleted: Bool?;
    public var showCheckedOut: Bool?;
    
    public var serverIP: String?;
    public var bluetoothServerMACs: [String]?;
    
    /**
     * Specifies if checkouts should automatically be checked out upon receivable.
     * 0 = disabled
     * 1-3 = Red Devices
     * 4-6 = Blue Devices
     * 7 = Pit
     */
    public var autoAssignmentMode: Int?;
    public var syncDisabled: Bool?;
    
    required init?(map: Map) {
        
    }
    
    init() {
        showPit = true;
        showCompleted = false;
        showCheckedOut = false;
        name = "";
        autoAssignmentMode = 0;
        syncDisabled = false;
        setServerIPToDefault();
    }
    
    func setServerIPToDefault() {
        self.serverIP = "ec2-13-59-164-241.us-east-2.compute.amazonaws.com";
    }
    
    func mapping(map: Map) {
        code <- map["code"];
        name <- map["code"];
        showPit <- map["showPit"];
        showCompleted <- map["showCompleted"];
        serverIP <- map["serverIP"];
        bluetoothServerMACs <- map["bluetoothServerMACs"];
    }
    
}
