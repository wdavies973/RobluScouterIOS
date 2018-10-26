//
//  IO.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 10/19/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class IO {
    
    func loadSyncSettings() -> RSyncSettings? {
        return nil;
    }
    
    func saveSyncSettings(syncSettings: RSyncSettings) {
        
    }
    
    func loadSettings() -> RSettings? {
        return nil;
    }
    
    func saveSettings(settings: RSettings) {
        
    }
    
    func saveForm(form: RForm) {
        
    }
    
    
    /*
     * CHECKOUTS
     */
    func saveCheckout(checkout: RCheckout) {
        
    }
    
    func loadCheckout(ID: Int) -> RCheckout? {
        return nil;
    }
    
    func loadCheckouts() -> [RCheckout]? {
        return nil;
    }
    
    /*
     * MY CHECKOUTS
     */
    func saveMyCheckout(checkout: RCheckout) {
        
    }
    
    func loadMyCheckout(ID: Int) -> RCheckout? {
        return nil;
    }
    
    func deleteMyCheckout(ID: Int) {
        
    }
    
    func loadMyCheckouts() -> [RCheckout]? {
        return nil;
    }
    
    /*
     * PENDING
     */
    func savePendingCheckout(checkout: RCheckout) {
        
    }
    
    func loadPendingCheckout(ID: Int) -> RCheckout? {
        return nil;
    }
    
    func loadPendingCheckouts() -> [RCheckout]? {
        return nil;
    }
    
    /*
     * Utility
     */
    func clearCheckouts() {
        
    }
    
}
