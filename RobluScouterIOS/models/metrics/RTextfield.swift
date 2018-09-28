//
//  RTextfield.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RTextfield : RMetric {
    
    public var text: String;
    public var numericalOnly: Bool;
    public var oneLine: Bool;
    
    init(ID: Int, title: String, text: String) {
        self.text = text;
        self.numericalOnly = false;
        self.oneLine = false;
        super.init(ID: ID, title: title);
    }
    
    init(ID: Int, title: String, numericalOnly: Bool, oneLine: Bool, text: String) {
        self.numericalOnly = numericalOnly;
        self.oneLine = oneLine;
        self.text = text;
        super.init(ID: ID, title: title);
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Text field\nDefault value: "+String(text);
    }
    
    override func clone() -> RMetric {
        return RTextfield(ID: self.ID, title: self.title, numericalOnly: self.numericalOnly, oneLine: self.oneLine, text: self.text);
    }
    
}
