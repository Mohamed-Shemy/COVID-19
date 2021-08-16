//
//  AppDelegate.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    private lazy var appRouter = AppRouter()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        appRouter.launchFirstScreen()
        
        return true
    }
}

