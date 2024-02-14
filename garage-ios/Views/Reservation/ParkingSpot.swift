//
//  ParkingSpot.swift
//  garage-ios
//
//  Created by Tibor Kovacs on 08/02/2024.
//

import SwiftUI

struct ParkingSpot: View {
    let parkId: String
    let fullName: String
    @State var parkSpot: String
    @State var color: Color = Color.green

    init(_ parkId: String? = nil, _ fullName: String? = nil) {
        self.parkId = parkId ?? ""
        self.fullName = fullName ?? ""
        self.parkSpot = self.parkId
    }
    
    var body: some View {
            ZStack {
                Rectangle().fill(color)
                Text(parkSpot)
            }
            .opacity(parkId == "" ? 0 : 1)
            .onTapGesture {
                changeColor()
                reserveSpot()
            }
    }
    
    func changeColor() {
        if(color == Color.green) {
            color = Color.red
        }
        else {
            color = Color.green
        }
    }
    
    func reserveSpot() {
        if(fullName.isEmpty) {
            return
        }
            
        if(parkSpot.count == 1) {
            parkSpot = parkId + " " + fullName
        } else {
            parkSpot = parkId
        }
    }
    
}
