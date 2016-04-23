//
//  AppDelegate.swift
//  StoreSearch
//
//  Created by Field Service on 4/14/16.
//  Copyright © 2016 Alejandro Gomez Mutis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var splitViewController: UISplitViewController {
        return window!.rootViewController as! UISplitViewController
    }
    
    var searchViewController: SearchViewController {
        return splitViewController.viewControllers.first as! SearchViewController
    }
    
    var detailNavigationController: UINavigationController {
        return splitViewController.viewControllers.last as! UINavigationController
    }
    
    var detailViewController: DetailViewController {
        return detailNavigationController.topViewController as! DetailViewController
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
        splitViewController.delegate = self
        searchViewController.splitViewDetail = detailViewController
        customizeAppearance()
        return true
    }
    
    func customizeAppearance() {
        let barTintColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
        UISearchBar.appearance().barTintColor = barTintColor
        
        window!.tintColor = UIColor(red: 10/255, green: 80/255, blue: 80/255, alpha: 1)
    }

}

extension AppDelegate: UISplitViewControllerDelegate {
    
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        print(__FUNCTION__)
        if displayMode == .PrimaryOverlay {
            svc.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}

