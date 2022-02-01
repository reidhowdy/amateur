//
//  amateurApp.swift
//  amateur
//
//  Created by Grace on 1/26/22.
//

import SwiftUI
import Firebase

@main
struct amateurApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let loginViewModel = LoginViewModel() //ref to login view model
            ContentView()
                .environmentObject(loginViewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
