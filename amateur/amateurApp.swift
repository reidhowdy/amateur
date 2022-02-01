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
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let loginViewModel = LoginViewModel() //ref to login view model
            ContentView()
                .environmentObject(loginViewModel)
        }
    }
}

//from Hacking with Swift
//"How to add an AppDelegate to a SwiftUI app"
//I used a different configuration when I added Firebase to my other app
//This may be a place to troubleshoot later on 
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        print("Your code here")
//        return true
//    }
//}
