//
//  garage_iosApp.swift
//  garage-ios
//
//  Created by Tibor Kovacs on 05/02/2024.
//

import SwiftUI
import StrivacitySDK

@main
struct GarageIosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        
        WindowGroup {
            ContentView(controller: UIController(appDelegate: appDelegate))
        }
    }
}
