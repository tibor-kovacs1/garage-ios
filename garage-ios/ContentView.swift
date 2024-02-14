//
//  ContentView.swift
//  garage-ios
//
//  Created by Tibor Kovacs on 05/02/2024.
//

import SwiftUI
import StrivacitySDK

struct ContentView: View {
    @ObservedObject var controller: UIController
    
    init(controller: UIController) {
        self.controller = controller
        // if we didn't logout and restart the app, this will set 'isAuthenticated' property to true
        controller.checkAuthenticated()
    }
    
    var body: some View {
        if controller.isAuthenticated {
            GarageReservation(controller: controller)
            LogoutView(controller: controller)
        } else {
            LoginView(controller: controller)
        }
    }
}

#Preview {
    ContentView(controller: UIController(appDelegate: AppDelegate()))
}
