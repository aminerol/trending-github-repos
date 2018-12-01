//
//  AppDelegate.swift
//  githubrepos
//
//  Created by Monsef Chakir on 29/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //creating the main window with hieght and width of the screen
        window = UIWindow.init(frame: UIScreen.main.bounds)
        //make this window visible and the main one
        window?.makeKeyAndVisible()
        
        // a navigation controller with the main layout as root
        let navController = UINavigationController(rootViewController: ViewController())
        
        //set the root view controller of the main window with the nav controller created above
        window?.rootViewController = navController
        
        // custimization for the navigation bar
        UINavigationBar.appearance().barTintColor = UIColor.mainColor
        UINavigationBar.appearance().shadowImage =  UIImage() // remove the shadow image by set to an empty UIimage
        UINavigationBar.appearance().barStyle = .blackOpaque
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        application.statusBarStyle = .lightContent
        
        
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


}

