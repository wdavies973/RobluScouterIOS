//
//  RTextfield.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/28/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation
import ObjectMapper

class RTextfield : RMetric {
    
    public var text: String?;
    public var numericalOnly: Bool?;
    public var oneLine: Bool?;
    
    required init?(map: Map) {
        super.init(ID: 0, title: "")
    }
    
    init(ID: Int, title: String, text: String) {
        super.init(ID: ID, title: title);
        self.text = text;
        self.numericalOnly = false;
        self.oneLine = false;
    }
    
    init(ID: Int, title: String, numericalOnly: Bool, oneLine: Bool, text: String) {
        super.init(ID: ID, title: title);
        self.numericalOnly = numericalOnly;
        self.oneLine = oneLine;
        self.text = text;
    }
    
    override func getFormDescriptor() -> String {
        return "Type: Text field\nDefault value: "+String(text!);
    }
    
    override func clone() -> RMetric {
        return RTextfield(ID: self.ID!, title: self.title!, numericalOnly: self.numericalOnly!, oneLine: self.oneLine!, text: self.text!);
    }
    
    override func mapping(map: Map) {
        text <- map["text"];
        numericalOnly <- map["numericalOnly"];
        oneLine <- map["oneLine"];
    }
    
}
