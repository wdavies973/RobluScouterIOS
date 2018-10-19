//
//  AppDelegate.swift
//  RobluScouterIOS
//
//  Created by Will H Davies on 9/14/18.
//  Copyright © 2018 Will H Davies. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // Test

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        test()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func test() {
        // Create some metrics
        var points = RCounter(ID: 1, title: "Points", increment: 1, value: 10);
        var good = RBoolean(ID: 2, title: "Good?", value: false);
        var calculation = RCalculation(ID: 3, title: "Points * 2");
        calculation.calculation = "Points*2";
        var checkbox = RCheckbox(ID: 4, title: "Checkbox", values: [(item: "o1", value: false), (item: "o2", value: true)]);
        var chooser = RChooser(ID: 5, title: "Chooser", values: ["o1", "o2"], selectedIndex: 0);
        var divider = RDivider(ID: 6, title: "Divider");
        var slider = RSlider(ID: 7, title: "Slider", min: 0, max: 10, value: 0);
        var stopwatch = RStopwatch(ID: 8, title: "Stopwatch", time: 0);
        var textfield = RTextfield(ID: 9, title: "Ree", text: "");
        
        var text2 = RTextfield(ID: 1, title: "Tester", text: "")
        
        // Create the forms
        let match = [points, good, calculation, checkbox, chooser, divider, slider, stopwatch, textfield] as [RMetric];
        
        // Create the bigger models
        let form = RForm(pit: [text2], match: match);
        let team = RTeam(name: "Team1", number: 4859, ID: 0);
        
        team.verify(form: form);
        
        // Do some verification checks
        var testsPassed: Int = 0;
        let totalTests: Int = 1;
        if(team.getMetrics(page: 1).count == 9) {testsPassed += 1;}
        
        print("Tests passed: ",(testsPassed)," / ",totalTests)
    }
    
    
}

