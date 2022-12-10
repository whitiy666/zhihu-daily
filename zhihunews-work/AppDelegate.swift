//
//  AppDelegate.swift
//  zhihunews-work
//


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        UIWindow()
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
        return true
    }

}
