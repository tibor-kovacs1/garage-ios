//
//  Controller.swift
//  garage-ios
//
//  Created by Tibor Kovacs on 09/02/2024.
//

import UIKit
import StrivacitySDK

class UIController: ObservableObject {
    @Published var errorText: String?
    @Published var accessToken: String?
    @Published var claims: [AnyHashable: Any]?
    @Published var isAuthenticated = false
    
    let appDelegate: AppDelegate

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }
    
    func startFlow(viewController: UIViewController) {
        appDelegate.provider.startFlow(viewController: viewController) { accessToken, claims in
            print("success")
            self.isAuthenticated = true
            self.errorText = nil
            self.accessToken = accessToken
            self.claims = claims
        } onError: { error in
            print("error")
            self.errorText = error.localizedDescription
            self.isAuthenticated = false
            self.accessToken = nil
            self.claims = nil
        }
    }
    
    func getAccessToken() {
        appDelegate.provider.getAccessToken { accessToken in
            self.accessToken = accessToken
        } onError: { error in
            self.errorText = error.localizedDescription
        }
    }
    
    func setClaims() {
        self.claims = appDelegate.provider.getLastRetrievedClaims()
    }
    
    func getClaimValue(key: AnyHashable) -> String {
        return String(describing: claims?[key] ?? "")
    }
    
    func logout(viewController: UIViewController) {
        appDelegate.provider.logout(viewController: viewController) { error in
            self.errorText = error?.localizedDescription
            self.isAuthenticated = false
        }
    }
    
    func checkAuthenticated() {
        appDelegate.provider.checkAuthenticated { isAuthenticated in
            self.isAuthenticated = isAuthenticated
        }
    }
}
