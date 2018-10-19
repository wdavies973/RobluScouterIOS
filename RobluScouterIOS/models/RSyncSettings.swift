//
//  RSyncSettings.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 10/19/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RSyncSettings {
    
    public var teamNumber: Int?;
    public var eventName: String?;
    public var teamSyncID: Int64?;
    public var checkoutSyncIDs: [(ID: Int, time: Int64)]?;
    public var lastBluetoothCheckoutSync: Int64?;
    
    init() {
        if(self.lastBluetoothCheckoutSync == nil) {
            checkoutSyncIDs = [];
        }
    }
}
