//
//  Login.swift
//  garage-ios
//
//  Created by Tibor Kovacs on 12/02/2024.
//

import SwiftUI
import StrivacitySDK

struct LoginView: View {
    @ObservedObject var controller: UIController
    
    var body: some View {
        Button("Login") {
            controller.startFlow(viewController: getViewController())
        }
        Text(controller.errorText ?? "")
    }
    
    private func getViewController() -> UIViewController {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene!.keyWindow!.rootViewController!
    }
}
