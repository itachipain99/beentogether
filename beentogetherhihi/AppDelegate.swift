//
//  AppDelegate.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/3/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let lauchbefore = UserDefaults.standard.bool(forKey: "lauchbefore")
        // Override point for customization after application launch.
        if lauchbefore{
            let controller = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            UserDefaults.standard.set(false, forKey: "lauchbefore")
            self.window?.rootViewController = controller
            self.window?.makeKeyAndVisible()
        }
        else {
            let controller = sb.instantiateViewController(withIdentifier: "SlideMenu") as! SlideMenu
            self.window?.rootViewController = controller
            self.window?.makeKeyAndVisible()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

