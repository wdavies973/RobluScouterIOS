//
//  RTeam.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import Foundation

class RTeam {
    
    private var ID: Int?
    private var name: String?
    private var number: Int?
    private var lastEdit: Int64?
    private var tabs:[RTab]?
    private var page: Int?
    
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
        if(self.tabs == nil || self.tabs!.count == 0) {
            self.tabs = [];
            // Clone RTab arrays
            var pit:[RMetric] = [];
            var match:[RMetric] = [];
            for metric in form.pit! {
                pit.append(metric.clone());
            }
            for metric in form.match! {
                match.append(metric.clone());
            }
            
            addTab(tab: RTab(title: "Pit", metrics: pit, redAlliance: false, won: false, time: 0))
            addTab(tab: RTab(title: "Predictions", metrics: match, redAlliance: false, won: false, time: 0))
            
            for metric in self.tabs![0].metrics! {
                if(metric.ID == 0) {
                    let textfield: RTextfield = metric as! RTextfield;
                    textfield.text = self.name!;
                } else if(metric.ID == 1) {
                    let textfield: RTextfield = metric as! RTextfield;
                    textfield.text = String(self.number!);
                }
            }
        }
        
        // Remove elements that aren't on the form
        var temp:[RMetric] = form.pit!;
        for i in 0..<tabs!.count {
            if(tabs![i].title != "Pit") {temp = form.match!;}
            for var j in 0..<tabs![i].metrics!.count {
                var found: Bool = false;
                if(temp.count == 0) {
                    tabs![i].metrics!.removeAll();
                    j = 0;
                }
                for k in stride(from: 0, to: temp.count, by: 1) {
                    if(tabs![i].metrics![j].ID == temp[k].ID) {
                        found = true;
                    }
                    if(k == temp.count - 1 && !found) {
                        tabs![i].metrics?.remove(at: j)
                        j = 0;
                        break;
                    }
                }
            }
        }
        
        /*
         * Alright, so we removed old elements, but we're still very suspicious. For example,
         * let's say the user edited the form (by removing an element), didn't re-verify any teams (by not opening them),
         * and then added a new element in the position of the old one. What will happen is that the above method will
         * NOT remove the old metric instance, and instead below the metrics name will not get updated. So, here we will
         * make sure that both the ID and INSTANCE TYPE of each metric (in the form and team) match, otherwise, the metric
         * gets booted.
         */
        temp = form.pit!;
        for i in 0..<tabs!.count {
            if(tabs![i].title != "Pit") {temp = form.match!;}
            for var j in 0..<temp.count {
                for var k in 0..<tabs![i].metrics!.count {
                    if(object_getClassName(temp[j]) != object_getClassName(tabs![i].metrics![k])) {
                        tabs![i].metrics!.remove(at: k);
                        j = 0;
                        k = 0;
                    }
                }
            }
        }
        
        // Add elements that are on the form, but not in this team
        temp = form.pit!;
        for i in 0..<tabs!.count {
            if(tabs![i].title != "Pit") {temp = form.match!;}
            for var j in 0..<temp.count {
                var found: Bool = false;
                if(tabs![i].metrics!.count == 0) {
                    tabs![i].metrics!.append(temp[j].clone());
                    continue;
                }
                for k in 0..<tabs![i].metrics!.count {
                    if(tabs![i].metrics![k].ID == temp[j].ID) {found = true;}
                    if(k == tabs![i].metrics!.count - 1 && !found) {
                        tabs![i].metrics!.append(temp[j].clone());
                        j = 0;
                        break;
                    }
                }
            }
        }
        
        // Update item names
        temp = form.pit!;
        for i in 0..<tabs!.count {
            if(tabs![i].title != "Pit") {temp = form.match!;}
            for j in 0..<temp.count {
                for k in 0..<tabs![i].metrics!.count {
                    if(temp[j].ID == tabs![i].metrics![k].ID) {
                        tabs![i].metrics![k].title = temp[j].title;
                        break;
                    }
                }
            }
        }
        
        // Update default values for non-modified values, also check for some weird scenarios
        temp = form.pit!;
        for i in 0..<tabs!.count {
            if(tabs![i].title != "Pit") {temp = form.match!;}
            for j in 0..<temp.count {
                for k in 0..<tabs![i].metrics!.count {
                    if(temp[j].ID == tabs![i].metrics![k].ID) {
                        let e: RMetric = temp[j]; // e if from the form
                        let s = tabs![j].metrics![k]; // s is the value being updated
                        
                        if(e is RBoolean && !s.isModified() && s is RBoolean) {
                            let sboolean: RBoolean = s as! RBoolean;
                            let eboolean: RBoolean = e as! RBoolean;
                            sboolean.value = eboolean.value;
                        } else if(e is RCalculation && s is RCalculation) {
                            let scalculation: RCalculation = s as! RCalculation;
                            let ecalculation: RCalculation = e as! RCalculation;
                            scalculation.calculation = ecalculation.calculation;
                        } else if(e is RCheckbox && s is RCheckbox) {
                            let scheckbox: RCheckbox = s as! RCheckbox;
                            let echeckbox: RCheckbox = e as! RCheckbox;
                            
                            // Update titles
                            for i in 0..<scheckbox.values!.count {
                                scheckbox.values![i].0 = echeckbox.values![i].0;
                                if(!s.isModified()) { // If not modified, also override the value
                                    scheckbox.values![i].1 = echeckbox.values![i].1;
                                }
                            }
                        } else if(e is RStopwatch && !s.isModified() && s is RStopwatch) {
                            (s as! RStopwatch).time = (e as! RStopwatch).time;
                            // Possibly laps need to be copied?
                        } else if(e is RTextfield && !s.isModified() && !(e as! RTextfield).oneLine) {
                            (s as! RTextfield).text = (e as! RTextfield).text;
                        } else if(e is RChooser && s is RChooser) {
                            (s as! RChooser).values = (e as! RChooser).values;
                            
                            if(!s.isModified()) {
                                (s as! RChooser).selectedIndex = (e as! RChooser).selectedIndex;
                            }
                        } else if(e is RSlider && !s.isModified() && s is RSlider) {
                            (s as! RSlider).max = (e as! RSlider).max;
                            (s as! RSlider).min = (e as! RSlider).min;
                            (s as! RSlider).value = (e as! RSlider).value;
                        } else if(e is RCounter && s is RCounter) {
                            (s as! RCounter).increment = (e as! RCounter).increment;
                            
                            (s as! RCounter).verboseInput = (e as! RCounter).verboseInput;
                            if(!s.isModified()) {
                                (s as! RCounter).value = (e as! RCounter).value;
                            }
                        }
                        break;
                    }
                }
            }
        }
    }
    
    func addTab(tab: RTab) -> Int {
        tabs?.append(tab);
        images.sorted(by: { $0.fileID > $1.fileID })
        for i in stride(from: 0, to: self.tabs!.count, by: 1) {
            if(self.tabs![i].title == tab.title) { return i; }
        }
        return 1;
    }
    
    func removeTab(position: Int) {
        tabs!.remove(at: position);
    }
    
    func getMetrics(page: Int) -> [RMetric] {
        return tabs![page].metrics!;
    }
    
    func removeAllTabsButPit() {
        if(tabs == nil || tabs!.count == 0) {return;}
        
        let pit: RTab = tabs![0];
        let predictions: RTab = tabs![1];
        tabs!.removeAll();
        tabs!.append(pit);
        tabs!.append(predictions);
    }
    func getNumMatches()-> Int {
        if(tabs == nil) {return 0;}
        else {return tabs!.count - 2;}
    }
    
}
