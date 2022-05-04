//
//  AppDelegate.swift
//  PokeDex
//
//  Created by Natthida Kritveeranant on 3/5/2565 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // Override point for customization after application launch.

        let navigation = UINavigationController(rootViewController: MainViewController())
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        return true
    }



}

