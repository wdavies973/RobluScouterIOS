//
//  RTeam.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RTeam {
    
    private var ID: Int
    private var name: String
    private var number: Int
    private var lastEdit: Int64
    private var tabs:[RTab]
    private var page: Int
    
    init() {}
    
    init(name: String, number: Int, ID: Int) {
        self.name = name;
        self.number = number;
        self.ID = ID;
        self.page = 1;
        
        lastEdit = 0;
    }
    
    // Verifies the team and form are in sync
    public func verify(form: RForm) {
        
        
    }
    
}
