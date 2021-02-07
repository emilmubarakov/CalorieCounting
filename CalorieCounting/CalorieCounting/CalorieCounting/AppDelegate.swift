//
//  AppDelegate.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 10.12.2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureAppearance()
        return true
    }
    
    private func configureAppearance() {
        if #available(iOS 13, *) {
            UISegmentedControl.appearance().selectedSegmentTintColor = .coreBlue
        }
        else {
            UISegmentedControl.appearance().tintColor = .coreBlue
        }
        UINavigationBar.appearance().tintColor = .coreBlue
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.coreBlue], for: .normal)
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .coreBlue
        
        // This fixes a strange dark shadow at the top right of the navigation bar
        // during a push/show segue transition to and back
        if #available(iOS 13.0, *) {
            window?.backgroundColor = .systemBackground
        } else {
            window?.backgroundColor = .white
        }
    }
}
