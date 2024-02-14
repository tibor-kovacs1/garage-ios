//
//  GarageReservation.swift
//  garage-ios
//
//  Created by Tibor Kovacs on 12/02/2024.
//

import SwiftUI
import StrivacitySDK

struct GarageReservation: View {
    @ObservedObject var controller: UIController
    
    var givenName: String
    var familyName: String
    var fullName: String
    init(controller: UIController) {
        self.controller = controller
        givenName = controller.getClaimValue(key: "given_name")
        familyName = controller.getClaimValue(key: "family_name")
        fullName = givenName + " " + familyName
    }
    
    var body: some View {
        VStack {
            HStack {
                ParkingSpot("1", fullName)
                ParkingSpot("2", fullName)
                ParkingSpot("3", fullName)
            }
            HStack {
                ParkingSpot("4", fullName)
                ParkingSpot()
                ParkingSpot("5", fullName)
            }
            HStack {
                ParkingSpot()
                ParkingSpot()
                ParkingSpot()
            }
        }
    }
}
